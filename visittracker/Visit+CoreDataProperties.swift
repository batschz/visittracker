//
//  Visit+CoreDataProperties.swift
//  visittracker
//
//  Created by Werner Huber on 01/05/16.
//  Copyright © 2016 Werner Huber. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Visit {

    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var radius: Double
    @NSManaged var arrival: NSTimeInterval
    @NSManaged var departure: NSTimeInterval
    @NSManaged var arrivalCallback: NSTimeInterval
    @NSManaged var departureCallback: NSTimeInterval

}
