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
    
    var category: String?
    
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

        self.title = category
    
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
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
        cell.phoneLabel2.text = institutes.array[indexPath.row].phone_2
        cell.centreDescription.text = institutes.array[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (institutes.array[indexPath.row].phone_1 != "") {
            
            if (institutes.array[indexPath.row].phone_2 != "")
            {
                let innerAlert = UIAlertController(title: "Выберете Номер", message: "На какой номер хотите позвонить?", preferredStyle: UIAlertControllerStyle.alert)
                innerAlert.addAction(UIAlertAction(title: "\(institutes.array[indexPath.row].phone_1)", style: UIAlertActionStyle.default, handler: { action in
                    let temp = self.returnNumber(number: self.institutes.array[indexPath.row].phone_1)
                    if let url = NSURL(string: "telprompt:\(temp)"){
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                        } else { }
                    }
                }  ))
                innerAlert.addAction(UIAlertAction(title: "\(institutes.array[indexPath.row].phone_2)", style: UIAlertActionStyle.default, handler:
                    { action in
                        let temp = self.returnNumber(number: self.institutes.array[indexPath.row].phone_2)
                        if let url = NSURL(string: "telprompt:\(temp)"){
                            if #available(iOS 10.0, *) {
                                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                            } else {}
                        }
                    }
                ))
                innerAlert.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default, handler: nil  ))
                self.present(innerAlert, animated: true, completion: nil)
            }
            else {
                let innerAlert = UIAlertController(title: "Позвонить", message: "Позвонить на номер \(institutes.array[indexPath.row].phone_1)?", preferredStyle: UIAlertControllerStyle.alert)
                innerAlert.addAction(UIAlertAction(title: "Да", style: UIAlertActionStyle.default, handler:
                { action in
                    let temp = self.returnNumber(number: self.institutes.array[indexPath.row].phone_1)
                    if let url = NSURL(string: "telprompt:\(temp)"){
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                        } else {}
                    }
                }))
                innerAlert.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default, handler: nil  ))
                self.present(innerAlert, animated: true, completion: nil)
            }
        }
    }
    func returnNumber(number: String) -> String {
        var ans = [Character]()
        for char in number {
            if ((String(char).rangeOfCharacter(from: CharacterSet.alphanumerics.inverted)) == nil) {
                ans.append(char)
            }
            else if (String(char) == "+"){
                ans.append(char)
            }
        }
        return String(ans)
    }
    
}

