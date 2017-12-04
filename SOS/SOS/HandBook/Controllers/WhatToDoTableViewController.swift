//
//  WhatToDoTableViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 11/28/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
enum ActionEnum: Int {
    case behave = 1
    case expect = 2
    case qa = 3
    
    func getTitle() -> String {
        switch self {
        case .behave:
            return "- Как себя вести?"
        case .expect:
            return "- Что ожидать?"
        case .qa:
            return "- Вопросы и ответы"
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
    var dateCellExpanded = [Bool]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateCellExpanded = [Bool](repeating: false, count: actions.count)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return actions.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dateCellExpanded[section] {
             return 4
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableViewAutomaticDimension
        
    }
}
