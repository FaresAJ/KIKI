//
//  CustomNavigationBar.swift
//  KIKI
//
//  Created by Fares Ajimi on 10/11/2021.
//

import UIKit

protocol CustomNavigationBarViewDelegate: AnyObject {
    func searchRestaurant(keyWord: String)
    func hideSearchListView()
    func routeToMapLocationPicker()
}

@IBDesignable
class CustomNavigationBarView: UIView {

    // MARK: - Outlets
    @IBOutlet weak var locationNameLabel: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - Properties

    @IBInspectable var nibName: String?
    var contentView: UIView?
    weak var delegate: CustomNavigationBarViewDelegate?

    // MARK: - Actions

    @IBAction func changeCurrentLocationButtonTapped(_ sender: Any) {
        delegate?.routeToMapLocationPicker()
    }

    // MARK: - Init & loading view

    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
        searchBar.delegate = self
    }

    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
                    [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }

    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
                    withOwner: self,
                    options: nil).first as? UIView
    }
}

extension CustomNavigationBarView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmptyOrWhitespace() {
            delegate?.hideSearchListView()
        } else {
            delegate?.searchRestaurant(keyWord: searchText)
        }
    }
}
