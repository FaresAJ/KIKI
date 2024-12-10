//
//  MapLocationPickerViewController.swift
//  KIKI
//
//  Created by Fares Ajimi on 29/12/2021.
//

import GoogleMaps
import GooglePlaces
import UIKit

protocol MapLocationPickerViewControllerProtocol: UIViewControllerRoutingProtocol {
}

class MapLocationPickerViewController: BaseViewController, MapLocationPickerViewControllerProtocol {

    // MARK: - Outlets

    @IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var addressTextfield: UITextField!

    // MARK: - Properties

    var router: MapLocationPickerRouterProtocol?
    private var address: LocationAPIModel?
    private let centerTunisiaCordination = [35.57506219776922, 9.485652968287468]

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setUpGoogleMaps()
    }

    // MARK: - UI

    private func setUpGoogleMaps() {
        googleMapView.delegate = self

        googleMapView.settings.compassButton = true
        googleMapView.isMyLocationEnabled = true
        googleMapView.settings.myLocationButton = true

        let latitude = centerTunisiaCordination[0]
        let longitude = centerTunisiaCordination[1]

        let location = GMSCameraPosition.camera(withLatitude: latitude,
                                                longitude: longitude,
                                                 zoom: 7.0)
        reverseGeocoding(location: location.target)
        let cameraUpdate = GMSCameraUpdate.setCamera(location)
        googleMapView.moveCamera(cameraUpdate)
    }

    // MARK: - Reverse GeoCoding

    private func reverseGeocoding(location: CLLocationCoordinate2D) {
        let geocoder = GMSGeocoder()
        var currentAddress = String()
        geocoder.reverseGeocodeCoordinate(location) { [weak self] response, error in
            if let address = response?.firstResult() {
                let lines = address.lines! as [String]
                guard let self = self else { return }
                currentAddress = lines.joined(separator: "\n")
                let coordinates = CoordinatesAPIModel(
                    type: .point,
                    coordinates: [location.latitude,
                                  location.longitude])
                self.address = LocationAPIModel(id: self.address?.id,
                                       address: currentAddress,
                                       label: self.address?.label,
                                       indication: self.address?.indication,
                                       coordinates: coordinates)
                self.addressTextfield.text = currentAddress
            }
        }
    }

    // MARK: - Actions

    @IBAction func locationTexfieldTapped(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt64(UInt(GMSPlaceField.name.rawValue) |
                                                                   UInt(GMSPlaceField.placeID.rawValue) |
                                                                   UInt(GMSPlaceField.coordinate.rawValue)))
        autocompleteController.placeFields = fields
        // Specify a filter for the search.
        let filter = GMSAutocompleteFilter()
        filter.country = "TN"
        autocompleteController.autocompleteFilter = filter

        present(autocompleteController, animated: true, completion: nil)
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        router?.route(to: .deliveryRestaurantList)
    }
}

// MARK: - Map view delegate

extension MapLocationPickerViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        reverseGeocoding(location: position.target)
    }
}

// MARK: - Autocomplete delegate

extension MapLocationPickerViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        addressTextfield.text = place.name
        dismiss(animated: true, completion: nil)
        let location = GMSCameraPosition.camera(
            withLatitude: place.coordinate.latitude,
            longitude: place.coordinate.longitude,
            zoom: 16.0)
        googleMapView.animate(to: location)
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}
