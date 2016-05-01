//
//  Visit.swift
//  visittracker
//
//  Created by Werner Huber on 01/05/16.
//  Copyright © 2016 Werner Huber. All rights reserved.
//

import Foundation
import CoreData


class Visit: NSManagedObject {

    var arrivalDate: NSDate {
        get {
            return NSDate(timeIntervalSinceReferenceDate: self.arrival)
        }
    }
    
    var departureDate: NSDate {
        get {
            return NSDate(timeIntervalSinceReferenceDate: self.departure)
        }
    }
    
    var arrivalCallbackDate: NSDate {
        get {
            return NSDate(timeIntervalSinceReferenceDate: self.arrivalCallback)
        }
    }
    
    var departureCallbackDate: NSDate {
        get {
            return NSDate(timeIntervalSinceReferenceDate: self.departureCallback)
        }
    }
    
    var isArrival: Bool {
        get {
            if self.departure == 0 {
                return true
            }
            return false
        }
    }
    
}
