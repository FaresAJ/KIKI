//
//  NotificationListTableViewCell.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import UIKit

class NotificationListTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    // MARK: - Properties

    static let identifier = "notificationListCell"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    // MARK: - UITableViewCell lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Actions

    func configure(notification: NotificationModel) {
        switch notification.notificationType?.lowercased() {
        case "order":
            notificationImageView.image = UIImage(named: "orderNotificationType")
        case "conversation":
            notificationImageView.image = UIImage(named: "conversationNotificationType")
        case "influencer":
            notificationImageView.image = UIImage(named: "influencerNotificationType")
        default:
            break
        }
        descriptionLabel.text = notification.description
        if let createdAt = notification.createdAt {
            timeLabel.text = createdAt
        }
    }

}
