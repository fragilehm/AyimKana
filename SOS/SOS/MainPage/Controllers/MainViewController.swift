//
//  MainViewController.swift
//  SOS
//
//  Created by Khasanza on 12/13/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: ViewController, CLLocationManagerDelegate {
    var messageComposer = MessageComposer()
    let locationManager = CLLocationManager()
    var userLongitude = CLLocationDegrees()
    var userLatitude = CLLocationDegrees()
    var message = ""
    //var names = Constants.MainPage.names
    var imageNames = ["infoImage", "institutionImage", "dangerZoneImage", "smsImage", "emergencyContactsImage", "storiesImage"]
    var descriptions = ["Что такое насилие? В этой категории вы найдете информацию о видах насилия, об учреждениях в которые вы можете обратиться и пошаговые инструкции действий для защиты ваших прав.", "В этой категории размещен справочник учреждений куда вы можете обратиться за помощью в случаях насилия", "На карте Кыргызстана вы сможете увидеть опасные зоны, где уровень гендерного насилия является высоким, и самостоятельно оставлять отметки о произошедших случаях.", "Оперативное оповещение круга доверенных лиц, о том, что вы находитесь в опасной ситуации и вам нужна помощь. СМС содержит текст вашего шаблона и координаты местоположения.", "Здесь вы можете добавить/изменять/удалять состав доверенным лиц. Так же написать шаблон SOS сообщения.", "В этом разделе вы можете анонимно высказаться о пережитом насилии или рассказать историю, где вы являетесь свидетелем. Также, вы можете прочитать истории других людей."]
    var storyboards = ["HandBook", "Green", "Pins", "SMS", "Registration", "Stories"]
    var vcs = ["HandBookViewController", "GreenMainViewController", "PinsViewController", "SMSViewController",
    "RegistrationViewController", "StoriesMainTableViewController"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "language".localized(lang: self.lang)!, style: .plain, target: self, action: #selector(addTapped))
        UserDefaults.standard.set(true, forKey: "wasLaunched")
        configureCollectionView()
        cofigureLocation()
    }
    @objc func addTapped(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Выберете Язык" , message: "", preferredStyle: .alert)
        let russianAction = UIAlertAction(title: "Русский", style: .default, handler: { (action) in
            DataManager.shared.setLanguage(language: "ru")
             self.navigationItem.title = Translation.mainMenu
            self.collectionView.reloadData()
        })
        let kyrgyzAction = UIAlertAction(title: "Кыргызча", style: .default, handler: { (action) in
            DataManager.shared.setLanguage(language: "ky")
             self.navigationItem.title = Translation.mainMenu
             self.collectionView.reloadData()
        })
        alertController.addAction(russianAction)
        alertController.addAction(kyrgyzAction)

        self.present(alertController, animated: true, completion: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
     
        self.navigationItem.title = Translation.mainMenu
    }
}
extension MainViewController {
    func configureCollectionView(){
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        collectionView?.contentInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
    }
    func cofigureLocation(){
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

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Translation.menuNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        cell.fillCell(title: Translation.menuNames[indexPath.row],
                      imageName: imageNames[indexPath.row],
                      description: descriptions[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: (itemSize * 5) / 4)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            if (self.messageComposer.canSendText()) {
                let messageComposeVC = self.messageComposer.configuredMessageComposeViewController()
                messageComposeVC.body = "\(DataManager.shared.getMessage()) \nhttp://maps.google.com/?saddr=\(userLatitude),\(userLongitude)"
                messageComposeVC.recipients = DataManager.shared.getNumbers()
                print(DataManager.shared.getNumbers())
                //                print(messageComposeVC.recipients)
                
                //messageComposeVC.addAttachmentURL(self.locationVCardURLFromCoordinate(coordinate: CLLocationCoordinate2D(latitude: self.userLatitude, longitude: self.userLongitude))! as URL, withAlternateFilename: "vCard.loc.vcf")
                
                self.present(messageComposeVC, animated: true, completion: nil)
            } else {
                let errorAlert = UIAlertView(title: "can not send", message: "Your device is not able to send a message", delegate: self, cancelButtonTitle: "OK")
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
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    func getVC(storyboard: String, name: String) -> UIViewController {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: name)
    }
}

