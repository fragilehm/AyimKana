//
//  AddStoryViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class AddStoryViewController: UIViewController {

    
    @IBOutlet weak var myStoryTextView: UITextView!
    
    @IBOutlet weak var myNumberTextField: UITextField!
    
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBAction func AddButtonAction(_ sender: Any) {
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
