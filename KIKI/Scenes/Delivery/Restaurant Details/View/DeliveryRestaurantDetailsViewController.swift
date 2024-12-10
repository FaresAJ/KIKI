//
//  DeliveryRestaurantDetailsViewController.swift
//  KIKI
//
//  Created by Fares Ajimi on 2/12/2021.
//

import UIKit
import SkeletonView

protocol DeliveryRestaurantDetailsViewControllerProtocol: UIViewControllerRoutingProtocol {
    func display(restaurant: DeliveryRestaurantDetailsModel)
    func set(uuid: String)
}

class DeliveryRestaurantDetailsViewController: BaseViewController, DeliveryRestaurantDetailsViewControllerProtocol {

    // MARK: - Outlets

    @IBOutlet weak var customRestaurantDetailsHeaderView: CustomRestaurantDetailsHeaderView!

    // MARK: - Properties

    var router: DeliveryRestaurantDetailsRouterProtocol?
    var interactor: DeliveryRestaurantDetailsInteractorProtocol?

    // MARK: DI

    func set(uuid: String) {
        interactor?.set(uuid: uuid)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchRestaurantDetails()
    }
    // MARK: - UI

//    private func setUpUI() {
//    }

    // MARK: - Actions

    func display(restaurant: DeliveryRestaurantDetailsModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.customRestaurantDetailsHeaderView.display(restaurant: restaurant)
        }
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        router?.route(to: .deliveryRestaurantList)
    }
}
