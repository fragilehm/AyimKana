//
//  GreenViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation
class GreenViewController: ViewController, CLLocationManagerDelegate {

    @IBOutlet weak var directoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var greenView: UIView! {
        didSet {
            greenView.layer.masksToBounds = true
            greenView.layer.cornerRadius = 60
        }
    }
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        directoryLabel.text = Constants.StartingPage.directory[0]
        descriptionLabel.text = Constants.StartingPage.directory[1]
        //locationManager.delegate = self
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                    print("hello")
                }
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
        }
    }

}
