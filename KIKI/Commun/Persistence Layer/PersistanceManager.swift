//
//  PersistanceManager.swift
//  KIKI
//
//  Created by Fares Ajimi on 19/11/2021.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

protocol PersistenceManagerProtocol {
    var instance: Realm? { get }

    func saveObjects<T>(_ objects: [T]) where T: Persistable
    func fetchObjects<T>(_ type: Object.Type, resultType: T.Type) -> [T]? where T: Persistable
}

class PersistenceManager: PersistenceManagerProtocol {

    private let realm = try? Realm()
    var instance: Realm? {
        return realm
    }

    func saveObjects<T>(_ objects: [T]) where T: Persistable {
        var realmObjects = [Object]()
        for object in objects {
            realmObjects.append(object.managedObject())
        }
        try? instance?.write {
            realm?.add(realmObjects, update: .modified)
        }
    }

    func fetchObjects<T>(_ type: Object.Type, resultType: T.Type) -> [T]? where T: Persistable {
        guard let realm = instance else { return nil }
        let results = Array(realm.objects(type))
        var modelObjects = [T]()
        for object in results {
            guard let managedObject = object as? T.ManagedObject else { return nil }
            modelObjects.append(T.init(managedObject: managedObject))
        }
        return modelObjects
    }
}
