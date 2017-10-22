//
//  PinsViewController.swift
//  SOS
//
//  Created by Khasanza on 10/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import MapKit

class PinsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 2000
    var location: Location!
    var points = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let locationOfBishkek = CLLocation(latitude: 42.874722, longitude: 74.612222)
        
        mapView.showsUserLocation = true
        ServerManager.shared.getPins(setPins, error: showErrorAlert)
        
        mapView.delegate = self
        centerMapOnLocation(location: locationOfBishkek)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Зоны опасности"
    }
    
    func setPins(pins: Pins){
        setPoints(pins: pins)
    }
    
    func setPoints(pins: Pins) {
        self.title = "Карта"
        for i in pins.array {
            if let lat = Double(i.latitude), let lon = Double(i.longitude) {
                let point = MKPointAnnotation()
                point.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                point.title = i.info
                point.subtitle = "" //1123
                mapView.addAnnotation(point)
            }
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
