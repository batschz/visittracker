//
//  MapViewController.swift
//  visittracker
//
//  Created by Werner Huber on 01/05/16.
//  Copyright © 2016 Werner Huber. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    weak var visit: Visit!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        
        self.map.addAnnotation(VisitAnnotation(visit: self.visit))
        drawRadius()
        zoomToRegion()
    }
    
    func drawRadius() {
        let circle = MKCircle(centerCoordinate: CLLocationCoordinate2DMake(visit.latitude, visit.longitude), radius: visit.radius)
        map.addOverlay(circle)
    }
    
    func zoomToRegion() {
        
        let zoomRadius = max(self.visit.radius * 3, 200)
        
        let location = CLLocationCoordinate2D(latitude: self.visit.latitude, longitude: self.visit.longitude)
        let region = MKCoordinateRegionMakeWithDistance(location, zoomRadius, zoomRadius)
        map.setRegion(region, animated: true)
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if let overlay = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: overlay)
            circleRenderer.fillColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.2)
            return circleRenderer
        }
        return MKOverlayRenderer()
    }

}

class VisitAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var visit: Visit
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: visit.latitude, longitude: visit.longitude)
    }
    
    init(visit: Visit) {
        self.visit = visit
    }
}

