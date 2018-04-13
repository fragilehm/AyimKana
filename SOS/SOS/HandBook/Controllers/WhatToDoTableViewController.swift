//
//  WhatToDoTableViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 11/28/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

let aColor = UIColor.init(netHex: 0xBDBDBD).cgColor
var lang = ""

enum ActionEnum: Int {
    case behave = 1
    case expect = 2
    case qa = 3
    
    func getTitle() -> String {
        switch self {
        case .behave:
            return "    - \("behave".localized(lang: lang)!)"
        case .expect:
            return "    - \("expect".localized(lang: lang)!)"
        case .qa:
            return "    - \("qa".localized(lang: lang)!)"
        }
    }
    func getContent(_ content: Actions) -> String {
        switch self {
        case .behave:
            return content.behave
        case .expect:
            return content.expect
        case .qa:
            return content.qa
        }
    }
}
class WhatToDoTableViewController: UITableViewController {
   
    var actions = [Actions]()
    var wtdDescription = ""
    var dateCellExpanded = [Bool]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lang = DataManager.shared.getLanguage()
        print("Lang: ", lang)
        self.title = "what_to_do".localized(lang: lang)!
        
        dateCellExpanded = [Bool](repeating: false, count: actions.count)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView()
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return actions.count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == actions.count
        {
            return 1
        }
        else {
            if dateCellExpanded[section] {
                return 4
            } else {
                return 1
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == actions.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            cell.wtdDescriptionLabel.text = wtdDescription
            
            return cell
        } else {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "WhatToDoTableViewCell", for: indexPath) as! WhatToDoTableViewCell
            if indexPath.row == 0 {
                cell.set(text: actions[indexPath.section].title)
                cell.setHeader()
            } else {
                let actionType = ActionEnum(rawValue: indexPath.row)
                cell.set(text: actionType!.getTitle())
                cell.setTitle()
            }
            return cell

        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != actions.count {
            if indexPath.row == 0 {
                dateCellExpanded[indexPath.section] = !dateCellExpanded[indexPath.section]
                tableView.reloadData()
            } else {
                let sb = UIStoryboard(name: "HandBook", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "LegalViewController") as! LegalViewController
                let actionType = ActionEnum(rawValue: indexPath.row)
                vc.text = actionType!.getContent(actions[indexPath.section])
                vc.title = actionType!.getTitle()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableViewAutomaticDimension
        
    }
}
