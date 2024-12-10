//
//  TimeFormatter.swift
//  KIKI
//
//  Created by Fares Ajimi on 21/12/2021.
//

import Foundation

protocol TimeFormatterProtocol {
    func formatTimeToExpire(miliseconds: Int) -> String
    func formatTimeAgo(dateString: String) -> String
}

class TimeFormatter: DateComponentsFormatter, TimeFormatterProtocol {

    func formatTimeToExpire(miliseconds: Int) -> String {
        let minutes = Int((miliseconds / 1000) / 60)
        let hours = Int(minutes / 60)
        let days = Int(hours / 24)

        // swiftlint:disable line_length

        if days > 0 {
            if days > 1 {
                return "\(NSLocalizedString("expiresIn", comment: "")) \(days) \(NSLocalizedString("days", comment: ""))"
            } else {
                return "\(NSLocalizedString("expiresIn", comment: "")) \(days) \(NSLocalizedString("day", comment: ""))"
            }
        } else if hours > 0 {
            if hours > 1 {
                return "\(NSLocalizedString("expiresIn", comment: "")) \(hours) \(NSLocalizedString("hours", comment: ""))"
            } else {
                return "\(NSLocalizedString("expiresIn", comment: "")) \(hours) \(NSLocalizedString("hour", comment: ""))"
            }
        } else if minutes > 0 {
            if minutes > 1 {
                return "\(NSLocalizedString("expiresIn", comment: "")) \(minutes) minutes"
            } else {
                return "\(NSLocalizedString("expiresIn", comment: "")) \(minutes) minute"
            }
        }
        return ""
    }

    func formatTimeAgo(dateString: String) -> String {
        let date = dateString.toDate(withFormat: "yyyy-MM-dd HH:mm:ss.SSSSSS")
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date!, relativeTo: Date())
    }
}
