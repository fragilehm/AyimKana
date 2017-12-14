//
//  AddStoryViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class AddStoryViewController: UIViewController {

    
    @IBOutlet weak var myStoryTextView: UITextView! {
        didSet {
            myStoryTextView.layer.borderWidth = 0.7
            myStoryTextView.layer.borderColor = UIColor.init(netHex: 0xBDBDBD).cgColor
            myStoryTextView.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var myNumberTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.setTitle("Поделиться", for: .normal)
            addButton.layer.borderWidth = 0.7
            addButton.layer.borderColor = UIColor.init(netHex: 0xBDBDBD).cgColor
            addButton.layer.cornerRadius = 2
        }
    }
    
    
    @IBAction func AddButtonAction(_ sender: Any) {
        var story = Story(title: "Title", body: myStoryTextView.text, phoneNum: myNumberTextField.text!)
        ServerManager.shared.addStories(story: story, storyAdded, error: showErrorAlert)
    }
    
    func storyAdded() {
        self.navigationController?.popViewController(animated: true)
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
