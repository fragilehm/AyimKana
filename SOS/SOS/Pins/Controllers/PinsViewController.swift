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
    var gestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    
    var alertTxtField: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let locationOfBishkek = CLLocation(latitude: 42.874722, longitude: 74.612222)
        
        let plusBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaped))
        self.navigationItem.setRightBarButton(plusBtn, animated: true)
        
        mapView.showsUserLocation = true
        ServerManager.shared.getPins(setPins, error: showErrorAlert)
        
        mapView.delegate = self
        centerMapOnLocation(location: locationOfBishkek)
    }
    
    @objc func addTaped()
    {
        let alert = UIAlertController(title: "Добавление Опасной Зоны", message: "Выберете Место Которое Считаете Опасным", preferredStyle: UIAlertControllerStyle.alert)
        
        //alert.addAction(UIAlertAction(title: "Current Location", style: UIAlertActionStyle.default, handler: addCurrLocation))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: addChosenLocation))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func addChosenLocation(action: UIAlertAction)
    {
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mapView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    func addDangerMsg(action: UIAlertAction)
    {
       
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer)
    {
        //var defMsg = "N/A"
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        print("Coordinates are \(coordinate)")
    
        let addMsgAlert = UIAlertController(title: "Описание", message: "Добавьте Описание", preferredStyle: UIAlertControllerStyle.alert)
        
        addMsgAlert.addTextField { (textField) in
            textField.placeholder = "Message"
            
        }
    
        addMsgAlert.addAction(UIAlertAction(title: "Добавить", style: UIAlertActionStyle.default, handler: { action in
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            var pin = Pin()
            pin.info = addMsgAlert.textFields![0].text!
            pin.latitude = coordinate.latitude.description
            pin.longitude = coordinate.longitude.description
            ServerManager.shared.addPins(pin: pin, self.addPin, error: self.showErrorAlert)
            self.mapView.addAnnotation(annotation)
            self.gestureRecognizer.isEnabled = false
            //disable gestureRecognizer
        }))
        
        addMsgAlert.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: { action in
            self.gestureRecognizer.isEnabled = false
            //disable gestureRecognizer
        }  ))
        
        self.present(addMsgAlert, animated: true, completion: nil)
    
    }
    
    func addPin() {
        print("added")
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
