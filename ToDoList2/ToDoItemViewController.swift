//
//  ToDoItemViewController.swift
//  ToDoList2
//
//  Created by Chi Phan on 1/28/15.
//  Copyright (c) 2015 Chi Phan. All rights reserved.
//

import UIKit

class ToDoItemViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var toDoItemText: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.toDoItemText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var destinationVC = segue.destinationViewController as ToDoListTableViewController;
       
        
       // var toDoItem: ToDoItem
        // only do something if the save button is pressed
        if let buttonType = sender as? UIBarButtonItem {
            if buttonType != self.saveButton {
                return
            }
            else {
                if (!toDoItemText.text.isEmpty) {
                    //toDoList.append(ToDoItem(itemName: toDoItemText.text))
                    //toDoItem = ToDoItem(itemName: toDoItemText.text)
                    
                    // pass the new ToDoItem to the ToDoListTableViewController to be added to the list
                     destinationVC.receivedToDoItem = ToDoItem(itemName: toDoItemText.text)
                }
            }
        }
        
    }
    
    // keyboard management
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }



}
