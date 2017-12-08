//
//  DescriptionViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 11/28/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    var article: Article?
    @IBAction func firstButton(_ sender: Any) {
        let sb = UIStoryboard(name: "HandBook", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LegalViewController") as! LegalViewController
        vc.text = self.article?.legal
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = self.article?.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
