//
//  PersistanceService.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import CoreData

class PersistanceService {
    
    private init(){}
    
    static var shared: PersistanceService {
        return PersistanceService()
    }
    
    var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NasaApp")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
