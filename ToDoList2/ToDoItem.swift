//
//  ToDoItem.swift
//  ToDoList2
//
//  Created by Chi Phan on 1/28/15.
//  Copyright (c) 2015 Chi Phan. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool
    var creationDate: NSString
    
    init(itemName: String) {
        self.itemName = itemName
        completed = false
        creationDate = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        super.init()
    }
}
