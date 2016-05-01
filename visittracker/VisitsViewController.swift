//
//  VisitsViewController.swift
//  visittracker
//
//  Created by Werner Huber on 01/05/16.
//  Copyright © 2016 Werner Huber. All rights reserved.
//

import UIKit
import CoreData

class VisitsViewController: UITableViewController {

    var visits: [Visit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl?.addTarget(self, action: #selector(load), forControlEvents: .ValueChanged)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        load()
    }
    
    func load() {
        VisitManager.sharedInstance.fetchAll { (visits) in
            self.visits = visits
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? MapViewController {
            controller.visit = self.visits[self.tableView.indexPathForSelectedRow!.row]
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.visits.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("visitCell", forIndexPath: indexPath)

        let visit = self.visits[indexPath.row]
        
        if visit.isArrival {
            let diff = visit.arrivalCallbackDate.timeIntervalSinceDate(visit.arrivalDate)
            cell.textLabel?.text = "Arrival \(visit.latitude),\(visit.longitude) - \(visit.radius)"
            cell.detailTextLabel?.text = "\(visit.arrivalDate) - Time Diff \(diff)"
        } else {
            let diff = visit.departureCallbackDate.timeIntervalSinceDate(visit.departureDate)
            cell.textLabel?.text = "Departure \(visit.latitude),\(visit.longitude) - \(visit.radius)"
            cell.detailTextLabel?.text = "\(visit.departureDate) - Time Diff \(diff)"
        }

        return cell
    }

}
