//
//  AppDelegate.swift
//  visittracker
//
//  Created by Werner Huber on 01/05/16.
//  Copyright © 2016 Werner Huber. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    
    var locationManager = CLLocationManager()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startMonitoringVisits()
                
        return true
    }

    func applicationWillTerminate(application: UIApplication) {
        VisitManager.sharedInstance.saveContext()
    }

    func locationManager(manager: CLLocationManager, didVisit visit: CLVisit) {
        VisitManager.sharedInstance.createVisit(visit)
    }

}

