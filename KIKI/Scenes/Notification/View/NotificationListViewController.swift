//
//  NotificationListViewController.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import UIKit
import SkeletonView

protocol NotificationListViewControllerProtocol: UIViewControllerRoutingProtocol {
    func display(notifications: [NotificationModel])
}

class NotificationListViewController: BaseViewController, NotificationListViewControllerProtocol {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var interactor: NotificationListInteractorProtocol?
    var dataSource: NotificationListDataSource?
    private var isLoadingData: Bool = false
    private var offset: Int = 0

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        showSkeletonAnimation()
        setUpUI()
        interactor?.fetchNotifications(limit: 10, offset: 0)
    }

    // MARK: - UI

    private func setUpUI() {
        setUpTableView()
    }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(NotificationListTableViewCell.nib,
                           forCellReuseIdentifier: NotificationListTableViewCell.identifier)
        setUpPullToRefresh(action: #selector(handlePullRefresh(_:)),
                           tableView: tableView)
        tableView.alwaysBounceVertical = false
    }

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

    // MARK: - Actions

    func display(notifications: [NotificationModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.hideSkeleton()
            self.dataSource?.append(items: notifications)
            self.tableView.reloadData()
            self.isLoadingData = false
        }
    }

    @objc func handlePullRefresh(_ sender: UIRefreshControl) {
        showSkeletonAnimation()
        interactor?.fetchNotifications(limit: 10, offset: 0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height)
            && !isLoadingData && isConnected {
            isLoadingData = true
            offset += 10
            interactor?.fetchNotifications(limit: 10, offset: offset)
        }
    }
}
