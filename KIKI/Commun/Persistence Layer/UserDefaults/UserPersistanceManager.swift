//
//  UserDefaultsPersistanceManager.swift
//  KIVI
//
//  Created by ons  on 29/12/2021.
//

import Foundation

public protocol UserPersistable {
    associatedtype UserManagedObject: UserObject
    init(userObject: UserManagedObject)
    func userObject() -> UserManagedObject
}

protocol UserPersistenceManagerProtocol {
    var instance: UserDefaults? { get }
    func storeInfo(_ object: UserAPIModel)
    func getUserInfo(_ type: UserAPIModel) -> UserObject
}

class UserPersistenceManager: UserPersistenceManagerProtocol {
    var instance: UserDefaults? {
        return userDefaults
    }

    private let userDefaults: UserDefaults

    // MARK: - Lifecycle

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func storeInfo(_ object: UserAPIModel) {
        saveValue(forKey: "uuid", value: object.uuid)
        saveValue(forKey: "firstName", value: object.firstName)
        saveValue(forKey: "lastName", value: object.lastName)
        saveValue(forKey: "email", value: object.email)
        saveValue(forKey: "phone", value: object.phone)
        saveValue(forKey: "profilePicture", value: object.profilePicture)
        saveValue(forKey: "address", value: object.address)
    }

    func getUserInfo(_ type: UserAPIModel) -> UserObject {
        let userObject = UserObject()
        userObject.uuid = readValue(forKey: "uuid")
        userObject.firstName = readValue(forKey: "firstName")
        userObject.lastName = readValue(forKey: "lastName")
        userObject.email = readValue(forKey: "email")
        userObject.phone = readValue(forKey: "phone")
        userObject.profilePicture = readValue(forKey: "profilePicture")
        userObject.address = readValue(forKey: "address")
        return userObject
    }

    func removeUserInfos() {
        userDefaults.dictionaryRepresentation().keys.forEach { key in
            userDefaults.removeObject(forKey: key)
        }
    }

    // MARK: - Private

    private func saveValue(forKey key: String, value: Any?) {
        userDefaults.set(value, forKey: key)
    }

    private func readValue<T>(forKey key: String) -> T? {
        return userDefaults.value(forKey: key) as? T
    }
}
