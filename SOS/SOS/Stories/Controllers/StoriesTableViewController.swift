//
//  StoriesTableViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 12/13/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class StoriesTableViewController: UITableViewController {

    var storiesPages = StoriesPages()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ServerManager.shared.getAllStories(setStories, error: showErrorAlert)
        ServerManager.shared.getAllStoriesByPage(page_num: 1, setStoriesPages, error: showErrorAlert)
        //self.view.backgroundColor = UIColor.init(netHex: 0xF7F7F7)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    //override func viewWillAppear(_ animated: Bool) {
        //ServerManager.shared.getAllStories(setStories, error: showErrorAlert)
        //ServerManager.shared.getAllStoriesByPage(page_num: 1, setStories, error: showErrorAlert)
    //}
    
    func setStoriesPages(storiesPages: StoriesPages)
    {
        self.storiesPages = storiesPages
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storiesPages.array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell", for: indexPath) as! StoriesTableViewCell
        cell.storyContentLabel.text =
            storiesPages.array[indexPath.section].results[indexPath.row].body
        let dateFull  = storiesPages.array[indexPath.section].results[indexPath.row].timeAdded
        let indexEnd = dateFull.index(dateFull.startIndex, offsetBy: 9)
        cell.storyDate.text = String(dateFull.prefix(through: indexEnd))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == storiesPages.array[0].results.count - 1 {
            let page_num = (storiesPages.array[0].results.count / 10) + 1
            ServerManager.shared.getAllStoriesByPage(page_num: page_num, { (storiesPages) in
                self.storiesPages.array.append(contentsOf: storiesPages.array) //????
                //self.stories.array.append(contentsOf: stories.array)
                self.tableView.reloadData()
            }, error: showErrorAlert)
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
