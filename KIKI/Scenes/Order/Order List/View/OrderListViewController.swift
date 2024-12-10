//
//  OrderListViewController.swift
//  KIKI
//
//  Created by ons  on 31/12/2021.
//

import UIKit

protocol OrderListViewControllerProtocol: UIViewControllerRoutingProtocol {
    func display(orderList: [OrderModel])
    func display(restaurants: [DeliveryRestaurantCardModel])
}

class OrderListViewController: BaseViewController,
                               OrderListViewControllerProtocol {

    // MARK: - Outlets

    @IBOutlet weak var customNavigationBarView: CustomNavigationBarView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var orderAgainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var orderAgainCollectionView: UICollectionView!
    @IBOutlet weak var ordersCollectionView: UICollectionView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!

    // MARK: - Properties

    var interactor: OrderListInteractorProtocol?
    var dataSource: OrderAgainDataSource?
    var ongoingOrdersDataSource: OrderListDataSource?
    var deliveryRestaurantDataSource: DeliveryRestaurantDataSource?

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        showSkeletonAnimation()
        setUpUI()
        interactor?.fetchOrders(offset: 0, limit: 10)
        interactor?.fetchDeliveryRestaurant(offset: 0)
    }

    // MARK: - UI

    private func setUpUI() {
        setUpTableView()
        setUpCollectionsView()
    }

    private func setUpTableView() {
        tableView.dataSource = deliveryRestaurantDataSource
        tableView.register(DeliveryRestaurantListTableViewCell.nib,
                           forCellReuseIdentifier: DeliveryRestaurantListTableViewCell.identifier)
        tableView.alwaysBounceVertical = false
        tableView.isScrollEnabled = false
    }

    private func setUpCollectionsView() {
        orderAgainCollectionView.dataSource = dataSource
        orderAgainCollectionView.register(OrderAgainCollectionViewCell.nib,
                                          forCellWithReuseIdentifier: OrderAgainCollectionViewCell.identifier)
        ordersCollectionView.dataSource = ongoingOrdersDataSource
        ordersCollectionView.register(OrderListCollectionViewCell.nib,
                                      forCellWithReuseIdentifier: OrderListCollectionViewCell.identifier)
        orderAgainCollectionView.alwaysBounceHorizontal = false
        ordersCollectionView.alwaysBounceHorizontal = false
    }

    // MARK: - Actions

    private func showSkeletonAnimation() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.showAnimatedGradientSkeleton()
            self.ordersCollectionView.showAnimatedGradientSkeleton()
            self.orderAgainView.showAnimatedGradientSkeleton()
            guard let refreshControl = self.refreshControl else { return }
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
        }
    }

    func display(orderList: [OrderModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.orderAgainView.hideSkeleton()
            self.ordersCollectionView.hideSkeleton()
            if orderList.isEmpty {
                self.ordersCollectionView.set(isHidden: true)
                self.orderAgainView.set(isHidden: true)
            } else {
                self.dataSource?.set(items: orderList)
                self.ongoingOrdersDataSource?.set(items: orderList)
            }
            self.orderAgainCollectionView.reloadData()
            self.ordersCollectionView.reloadData()
        }
    }

    func display(restaurants: [DeliveryRestaurantCardModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.hideSkeleton()
            self.deliveryRestaurantDataSource?.set(items: restaurants)
            self.tableView.reloadData()
            self.tableViewHeightConstraint.constant = CGFloat(221 * self.tableView.numberOfRows(inSection: 0))
        }
    }
}
