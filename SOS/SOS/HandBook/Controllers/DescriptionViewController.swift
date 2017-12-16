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
    let lang = DataManager.shared.getLanguage()
    
    var article: Article?
    
    @IBOutlet weak var firstButton: UIButton!{
        didSet {
            firstButton.backgroundColor = UIColor.white
            firstButton.layer.borderWidth = 0.7
            firstButton.layer.borderColor = aColor
            firstButton.layer.cornerRadius = 2
            firstButton.setTitle("legal".localized(lang: lang)!, for: .normal)
        }
    }
    
    @IBAction func firstButton(_ sender: Any) {
        let sb = UIStoryboard(name: "HandBook", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LegalViewController") as! LegalViewController
        vc.text = self.article?.legal
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBOutlet weak var descriptionView: UIView! {
        didSet {
            descriptionView.layer.borderColor = aColor
            descriptionView.layer.borderWidth = 0.5
            descriptionView.layer.cornerRadius = 2
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = self.article?.description
        self.title = article?.title
        //self.navigationItem.title = "A Title"
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
            whatToDoButton.layer.borderWidth = 0.7
            whatToDoButton.layer.borderColor = aColor
            whatToDoButton.layer.cornerRadius = 2
            whatToDoButton.setTitle("what_to_do".localized(lang: lang)!, for: .normal)
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
