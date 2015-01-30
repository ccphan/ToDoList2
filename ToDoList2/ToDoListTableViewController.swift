//
//  ToDoListTableViewController.swift
//  ToDoList2
//
//  Created by Chi Phan on 1/28/15.
//  Copyright (c) 2015 Chi Phan. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var receivedToDoItem: ToDoItem?
    // initialise empty array of string
    var toDoList = [ToDoItem]()
    
    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return toDoList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        //populate the cell label text property with contents
        var currentToDoItem = toDoList[indexPath.row]
        cell.textLabel?.text = currentToDoItem.itemName
        
        if (currentToDoItem.completed) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // respond to tap on cell
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // dont want it to remain selected when we tap
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        // grab the ToDoItem tapped
        var tappedItem = toDoList[indexPath.row]
        // toggle the completion status
        tappedItem.completed = !tappedItem.completed
        // tell table view to reload cell
        //tableView.reloadRowsAtIndexPaths(indexPath, withRowAnimation: UITableViewRowAnimation.None)
        tableView.reloadData()
    }
    
    // swipe to delete
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
        toDoList.removeAtIndex(indexPath.row)
        tableView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // For Unwind segue save and cancel buttons
    @IBAction func unwindToObjectives(segue: UIStoryboardSegue) {
        // Ideally the updating of the toDoList should be managed here and not in the ToDoItemViewController
        // That controller should only be responsible for updating a single ToDoItem 
        // The actually list view should be controlled here.
        //var source = segue.sourceViewController
        
        toDoList.append(receivedToDoItem!)
        
         // TO-DO: Put it in permeant storage somewhere
        
    }

}
