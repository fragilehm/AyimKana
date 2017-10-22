//
//  MainListViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CoreLocation

class MainListViewController: UIViewController, CLLocationManagerDelegate {
    var messageComposer = MessageComposer()
    let locationManager = CLLocationManager()
    var userLongitude = CLLocationDegrees()
    var userLatitude = CLLocationDegrees()
    var message = ""
    var names = ["Справочник", "Учреждения", "Опасные зоны", "СМС", "Контакты"]
    var descriptions = ["СправочникУчрежденияУчрежденияУчрежденияУчрежденияУчреждения", "УчреждеСправочникУчрежденияУчрежденияУчрежденияУчрежденияУчрежденияния", "ОпаСправочникУчрежденияУчрежденияУчрежденияУчрежденияУчреждениясные зоны", "ССправочникУчрежденияУчрежденияУчрежденияУчрежденияУчрежденияМС", "СправочникУчрежденияУчрежденияУчрежденияУчрежденияУчреждения"]
    var storyboards = ["HandBook", "Green", "Pins", "SMS", "Registration"]
    var vcs = ["HandBookViewController", "GreenMainViewController", "PinsViewController", "SMSViewController",
               "RegistrationViewController"]
    @IBOutlet weak var mainListTableView: UITableView! {
        didSet {
            mainListTableView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainListTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }

}
extension MainListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainListTableView.dequeueReusableCell(withIdentifier: "MainListTableViewCell", for: indexPath) as! MainListTableViewCell
        cell.nameLabel.text = names[indexPath.row]
        cell.descriptionTextView.text = descriptions[indexPath.row]
        cell.logoImageView.image = UIImage(named: "main\(indexPath.row)")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            if (self.messageComposer.canSendText()) {
                let messageComposeVC = self.messageComposer.configuredMessageComposeViewController()
                messageComposeVC.body = message
                messageComposeVC.addAttachmentURL(self.locationVCardURLFromCoordinate(coordinate: CLLocationCoordinate2D(latitude: self.userLatitude, longitude: self.userLongitude))! as URL, withAlternateFilename: "vCard.loc.vcf")
                self.present(messageComposeVC, animated: true, completion: nil)
            } else {
                let errorAlert = UIAlertView(title: "can not send", message: "Your device is not able to send", delegate: self, cancelButtonTitle: "Shit!")
                errorAlert.show()
            }
            
        }
        else {
            self.navigationController?.show(getVC(storyboard: storyboards[indexPath.row], name: vcs[indexPath.row]), sender: self)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            userLatitude = location.coordinate.latitude
            userLongitude = location.coordinate.longitude
        }
    }
    func locationVCardURLFromCoordinate(coordinate: CLLocationCoordinate2D) -> NSURL?
    {
        
        guard let cachesPathString = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else {
            print("Error: couldn't find the caches directory.")
            return nil
        }
        
        guard CLLocationCoordinate2DIsValid(coordinate) else {
            print("Error: the supplied coordinate, \(coordinate), is not valid.")
            return nil
        }
        
        let vCardString = [
            "BEGIN:VCARD",
            "VERSION:3.0",
            "N:;Shared Location;;;",
            "FN:Shared Location",
            "item1.URL;type=pref:http://maps.apple.com/?ll=\(coordinate.latitude),\(coordinate.longitude)",
            "item1.X-ABLabel:map url",
            "END:VCARD"
            ].joined(separator: "\n")
        
        let vCardFilePath = (cachesPathString as NSString).appendingPathComponent("vCard.loc.vcf")
        
        do {
            try vCardString.write(toFile: vCardFilePath, atomically: true, encoding: String.Encoding.utf8)
        }
        catch let error {
            print("Error, \(error), saving vCard: \(vCardString) to file path: \(vCardFilePath).")
        }
        
        return NSURL(fileURLWithPath: vCardFilePath)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied)
        {
            showLocationDisabledPopUp()
        }
    }
    
    func showLocationDisabledPopUp()
    {
        let alertController = UIAlertController(title: "Background Location Access Disabled", message: "Need your location in order to send it to your emergency contacts when needed", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    func getVC(storyboard: String, name: String) -> UIViewController {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: name)
    }
}
