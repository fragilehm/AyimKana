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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!

    @IBOutlet weak var DetailsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    var titles: [String] = []
    let regionRadius: CLLocationDistance = 2000
    var location: Location!
    var address = ""
    var institute: Institute?
    var points = [MKPointAnnotation]()
    override func viewDidLoad() {
        let centerLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        super.viewDidLoad()
        detailsView.isHidden = true
        mapView.showsUserLocation = true
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: (location.latitude), longitude: (location.longitude))
        point.title = "Адрес:"
        point.subtitle = address
        mapView.addAnnotation(point)
        mapView.delegate = self
        centerMapOnLocation(location: centerLocation)
        
        fillInfo()
    }
    func fillInfo() {
        self.nameLabel.text = institute?.name
        self.addressLabel.text = institute?.address
        self.phoneLabel.text = institute?.phone_1
        self.descriptionLabel.text = institute?.description
        self.linkLabel.text = institute?.website
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
            mapView.isHidden = false
            detailsView.isHidden = true
            
        case 1:
            mapView.isHidden = true
            detailsView.isHidden = false
        default:
            break;
        }
    }
}



