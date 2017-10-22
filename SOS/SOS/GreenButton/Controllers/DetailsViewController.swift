//
//  DetailsViewController.swift
//  SOS
//
//  Created by Khasanza on 10/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Foundation
import MapKit
import CoreLocation
import SwiftyJSON

class DetailsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

    @IBOutlet weak var DetailsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    var titles: [String] = []
    let regionRadius: CLLocationDistance = 2000
    var location: Location!
    var address = ""
    var points = [MKPointAnnotation]()
    override func viewDidLoad() {
        let centerLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        super.viewDidLoad()
        mapView.showsUserLocation = true
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: (location.latitude), longitude: (location.longitude))
        point.title = "Адрес:"
        point.subtitle = address
        mapView.addAnnotation(point)
        mapView.delegate = self
        centerMapOnLocation(location: centerLocation)

    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    @IBAction func valueChanged(_ sender: Any) {
        switch DetailsSegmentedControl.selectedSegmentIndex
        {
        case 0:
            let vc = UIStoryboard(name: "Green", bundle: nil).instantiateViewController(withIdentifier: "DetailedViewController")
            //self.navigationController?.show(vc, sender: self)
        case 1:
             let vc = UIStoryboard(name: "Green", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController")
             //self.navigationController?.show(vc, sender: self)

        default:
            break;
        }
    }
}



