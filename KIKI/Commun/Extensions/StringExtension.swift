//
//  StringExtension.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension String {
    func isEmptyOrWhitespace() -> Bool {
        if self.isEmpty {
            return true
        }
        return (self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() == "")
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
