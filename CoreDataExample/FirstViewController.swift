//
//  FirstViewController.swift
//  CoreDataExample
//
//  Created by Mac on 2/11/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UILabel!
    @IBOutlet weak var importanceTextField: UITextField!
    
    @IBOutlet weak var conditon1TextField: UITextField!
    @IBOutlet weak var condition2TextField: UITextField!
    
    
    var toDoItems = [ToDoItem]()
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    @IBAction func saveClicked(_ sender: Any) {
        
        let _toDoItem = ToDoItem()
        
        _toDoItem.title = titleTextField.text
        _toDoItem.content = contentTextField.text
        _toDoItem.importance = importanceTextField.text
        
        CoreDataManager.storeObj(_toDoItem)
        
    }
    
    
    @IBAction func showRecordClicked(_ sender: Any) {
        
       toDoItems = CoreDataManager.fetchObj()
        print(toDoItems.count)
        
    }
    
    
    @IBAction func deleteAllClicked(_ sender: Any) {
        CoreDataManager.deleteAllObjs()
    }
    

    @IBAction func fetchWithConClicked(_ sender: Any) {
        var _toDoItems = [ToDoItem]()
        _toDoItems = CoreDataManager.fetchObjWithConditions(condition1: conditon1TextField.text!, condition2: condition2TextField.text!)
        print(_toDoItems.count)
    }
    
    @IBAction func deleteWithConditionClicked(_ sender: Any) {
        
        CoreDataManager.deleteObjWithCondition(condition1: conditon1TextField.text!, condition2: condition2TextField.text!)
    }
    
}

