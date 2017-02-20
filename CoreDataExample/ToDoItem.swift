//
//  ToDoItem.swift
//  CoreDataExample
//
//  Created by Mac on 2/11/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var title: String?
    var content: String?
    var importance: String?
    
    override init() {
        super.init()
        title = ""
        content = ""
        importance = ""
    }
    
    init(_ title:String, content:String, importance:String) {
        super.init()
        self.title = title
        self.content = content
        self.importance = importance
    }

}
