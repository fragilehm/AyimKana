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
    
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var DetailsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var titles: [String] = []
    let regionRadius: CLLocationDistance = 2000
    var address = ""
    // var institute: Institute?
    var institutes = Institutes()
    var id = 0
    var points = [MKPointAnnotation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        detailsView.isHidden = true
        if titles.count == 0 {
            ServerManager.shared.getInstitutesById(id: id, setInstitutes, error: showErrorAlert)
        }
        
    }
    func setInstitutes(institutes: Institutes){
        self.institutes = institutes
        let locationOfBishkek = CLLocation(latitude: 42.874722, longitude: 74.612222)
        
        for item in institutes.array {
            let point = MKPointAnnotation()
            let location = Location(latitude: item.latitude, longitude: item.longitude)
            
            point.coordinate = CLLocationCoordinate2D(latitude: (location.latitude), longitude: (location.longitude))
            point.title = "Адрес: \(item.address)"
            //point.subtitle = titles[count]
            mapView.addAnnotation(point)
        }
        
        centerMapOnLocation(location: locationOfBishkek)
        tableView.reloadData()
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
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return institutes.array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstitutionTableViewCell", for: indexPath) as! InstitutionTableViewCell
        cell.nameLabel.text = institutes.array[indexPath.row].name
        cell.addressLabel.text = institutes.array[indexPath.row].address
        cell.phoneLabel.text = institutes.array[indexPath.row].phone_1
        
        return cell
    }
}

