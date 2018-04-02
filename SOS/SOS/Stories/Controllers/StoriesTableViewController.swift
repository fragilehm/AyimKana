//
//  StoriesTableViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 12/13/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class StoriesTableViewController: UITableViewController {

    var storiesPage = StoriesPage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getAllStoriesByPage(page_num: 1, setStoriesPage, error: showErrorAlert)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 1000
    }

    //override func viewWillAppear(_ animated: Bool) {
        //ServerManager.shared.getAllStories(setStories, error: showErrorAlert)
        //ServerManager.shared.getAllStoriesByPage(page_num: 1, setStories, error: showErrorAlert)
    //}
    
    func setStoriesPage(storiesPage: StoriesPage)
    {
        self.storiesPage = storiesPage
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storiesPage.results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell", for: indexPath) as! StoriesTableViewCell
        cell.storyContentLabel.text = storiesPage.results[indexPath.row].body
        let dateFull  = storiesPage.results[indexPath.row].timeAdded
        let indexEnd = dateFull.index(dateFull.startIndex, offsetBy: 9)
        cell.storyDate.text = String(dateFull.prefix(through: indexEnd))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == storiesPage.results.count - 1) && (storiesPage.results.count < storiesPage.count) {
            let page_num = (storiesPage.results.count / 3) + 1
            ServerManager.shared.getAllStoriesByPage(page_num: page_num, { (storiesPage) in
                self.storiesPage.results.append(contentsOf: storiesPage.results)
                self.tableView.reloadData()
            }, error: showErrorAlert)
        }
    }
    
}
