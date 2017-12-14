//
//  DescriptionViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 11/28/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    let aColor = UIColor.init(netHex: 0xBDBDBD).cgColor
    
    var article: Article?
    
    
    @IBOutlet weak var firstButton: UIButton!{
        didSet {
            firstButton.backgroundColor = UIColor.white
            firstButton.layer.borderWidth = 1
            firstButton.layer.borderColor = aColor
            firstButton.layer.cornerRadius = 2
        }
    }
    
    @IBAction func firstButton(_ sender: Any) {
        let sb = UIStoryboard(name: "HandBook", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LegalViewController") as! LegalViewController
        vc.text = self.article?.legal
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.backgroundColor = UIColor.white
            descriptionLabel.layer.borderColor = aColor
            descriptionLabel.layer.borderWidth = 1
            descriptionLabel.layer.cornerRadius = 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = self.article?.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var whatToDoButton: UIButton!
    {
        didSet {
            whatToDoButton.backgroundColor = UIColor.white
            whatToDoButton.layer.borderWidth = 1
            whatToDoButton.layer.borderColor = aColor
            whatToDoButton.layer.cornerRadius = 2
        }
    }
    
    @IBAction func whatToDoButton(_ sender: Any) {
        let sb = UIStoryboard(name: "HandBook", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WhatToDoTableViewController") as! WhatToDoTableViewController
        vc.actions = (self.article?.actions)!
        vc.wtdDescription = (self.article?.what_to_do)!
        navigationController?.pushViewController(vc, animated: true)
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
