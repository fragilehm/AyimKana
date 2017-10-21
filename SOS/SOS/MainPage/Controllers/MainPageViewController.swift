//
//  MainPageViewController.swift
//  SOS
//
//  Created by Khasanza on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var greenView: UIView! {
        didSet {
            greenView.layer.masksToBounds = true
            greenView.layer.cornerRadius = 100
        }
    }
    @IBOutlet weak var yellowView: UIView! {
        didSet {
            yellowView.layer.masksToBounds = true
            yellowView.layer.cornerRadius = 100
        }
    }
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var pinkView: UIView! {
        didSet {
            pinkView.layer.masksToBounds = true
            pinkView.layer.cornerRadius = 35
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
