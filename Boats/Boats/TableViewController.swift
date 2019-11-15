//
//  TableViewController.swift
//  Boats
//
// Created by Lance Davenport on 11/14/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let boats:[Boat] = [
        Boat(n: "Kayak", dp: 0, c: "Blue", s: "Small"),
        Boat(n: "Dinghy", dp: 7, c: "Pink", s: "Small"),
        Boat(n: "Yacht", dp: 100, c: "White", s: "Large"),
        Boat(n: "SS Tipton", dp: 1000, c: "Silver", s: "Huge"),
        Boat(n: "Submarine", dp: 500, c: "Yellow", s: "Medium"),
        Boat(n: "Raft", dp: 0, c: "Green", s: "Small"),
        Boat(n: "Mega Yatch", dp: 500000, c: "Pink", s: "Humongeous"),
        Boat(n: "Sail Boat", dp: 14, c: "Navy", s: "Medium")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return boats.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boat", for: indexPath)
        //let list = Array(vocab.keys)
        cell.textLabel?.text = boats[indexPath.row].name
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
         let vc = segue.destination as! ViewController
         // Pass the selected object to the new view controller.
         let indexPath = self.tableView.indexPathForSelectedRow
         let b = self.boats[indexPath!.row]
         vc.boat = b
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        let b = self.boats[indexPath!.row]
        vc.boat = b
    }
}

