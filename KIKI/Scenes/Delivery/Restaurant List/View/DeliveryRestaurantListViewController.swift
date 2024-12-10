//
//  DeliveryRestaurantListViewController.swift
//  KIKI
//
//  Created by Fares Ajimi on 10/11/2021.
//

import UIKit
import SkeletonView

protocol DeliveryRestaurantListViewControllerProtocol: UIViewControllerRoutingProtocol {
    func display(restaurantCollections: [RestaurantCollectionModel])
    func display(restaurants: [DeliveryRestaurantCardModel])
    func display(restaurantsSearchList: [RestaurantSearchModel])
}

class DeliveryRestaurantListViewController: BaseViewController,
                                            DeliveryRestaurantListViewControllerProtocol,
                                            CustomNavigationBarViewDelegate {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNavigationBarView: CustomNavigationBarView!

    // MARK: - Properties

    var router: DeliveryRestaurantListRouterProtocol?
    var interactor: DeliveryRestaurantListInteractorProtocol?
    var dataSource: DeliveryRestaurantDataSource?
    lazy private var tableViewContainer: DeliveryRestaurantListTableHeader? = .fromNib()
    lazy private var restaurantSearchListTableView: RestaurantSearchListTableView? = .fromNib()
    private var searchTimer: Timer?
    private var isLoadingData: Bool = false
    private var offset: Int = 0
    private var firstSearch = true

    // MARK: DI

    func set(dataSource: RestaurantSearchListDataSource) {
        restaurantSearchListTableView?.set(dataSource: dataSource)
    }

    func set(dataSource: CollectionCardHorizentalListDataSource) {
        tableViewContainer?.set(dataSource: dataSource)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        showSkeletonAnimation()
        setUpUI()
        interactor?.fetchDeliveryRestaurant(offset: 0)
        interactor?.fetchCollectionCardList()
    }

    // MARK: - UI

    override func refreshAfterReEstablishingConnexion() {
        showSkeletonAnimation()
        interactor?.fetchDeliveryRestaurant(offset: 0)
        interactor?.fetchCollectionCardList()
    }

    // MARK: - UI

    private func setUpUI() {
        customNavigationBarView.delegate = self
        setUpTableView()
    }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(DeliveryRestaurantListTableViewCell.nib,
                           forCellReuseIdentifier: DeliveryRestaurantListTableViewCell.identifier)
        setUpPullToRefresh(action: #selector(handlePullRefresh(_:)),
                           tableView: tableView)
        tableView.alwaysBounceVertical = false
    }

    private func setUpSearchListView() {
        guard let restaurantSearchListTableView = restaurantSearchListTableView else {return}
        restaurantSearchListTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restaurantSearchListTableView)

        NSLayoutConstraint.activate([
            restaurantSearchListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantSearchListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            restaurantSearchListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            restaurantSearchListTableView.topAnchor.constraint(equalTo: customNavigationBarView.bottomAnchor)
        ])
    }

    // MARK: - Actions

    private func showSkeletonAnimation() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.showAnimatedGradientSkeleton()
            guard let refreshControl = self.refreshControl else { return }
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
        }
    }

    func routeToMapLocationPicker() {
        router?.route(to: .mapLocationPicker)
    }

    func display(restaurantCollections: [RestaurantCollectionModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if restaurantCollections.count > 0 {
                self.tableViewContainer?.set(items: restaurantCollections)
                self.tableView.tableHeaderView = self.tableViewContainer
            }
        }
    }

    func display(restaurants: [DeliveryRestaurantCardModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.hideSkeleton()
            self.dataSource?.append(items: restaurants)
            self.tableView.reloadData()
            self.isLoadingData = false
        }
    }

    func display(restaurantsSearchList: [RestaurantSearchModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.restaurantSearchListTableView?.hideAnimatedSkeleton()
            self.restaurantSearchListTableView?.set(items: restaurantsSearchList)
        }
    }

    @objc func handlePullRefresh(_ sender: UIRefreshControl) {
        showSkeletonAnimation()
        interactor?.fetchDeliveryRestaurant(offset: 0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height)
            && !isLoadingData && isConnected {
            isLoadingData = true
            offset += 10
            interactor?.fetchDeliveryRestaurant(offset: offset)
        }
    }

    func searchRestaurant(keyWord: String) {
        restaurantSearchListTableView?.isHidden = false
        if firstSearch {
            setUpSearchListView()
            firstSearch = false
        }
        restaurantSearchListTableView?.showAnimatedSkeleton()
        setTimerForSearchRequest(keyWord: keyWord)
    }

    private func setTimerForSearchRequest(keyWord: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(sendSearchRequest),
            userInfo: keyWord,
            repeats: false)
    }

    @objc func sendSearchRequest() {
        if searchTimer?.userInfo != nil {
            guard let keyWord = searchTimer?.userInfo as? String else { return }
            interactor?.fetchDeliveryRestaurant(keyWord: keyWord)
        }
        searchTimer?.invalidate()
    }

    func hideSearchListView() {
        restaurantSearchListTableView?.isHidden = true
    }
}
