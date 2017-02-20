//
//  CoreDataManager.swift
//  CoreDataExample
//
//  Created by Mac on 2/11/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    class func storeObj(_ toDoItem: ToDoItem) {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ToDoItemEntity", in: context)
        let managedObj = NSManagedObject(entity: entity!, insertInto: context)
        
        
        managedObj.setValue(toDoItem.title, forKey: "title")
        managedObj.setValue(toDoItem.content, forKey: "content")
        managedObj.setValue(toDoItem.importance, forKey: "importance")
        
        do {
            try context.save()
            print("saved")
            
        } catch {
            print("Save Error:", error.localizedDescription)
        }
        
    }
    
    
    class func fetchObj() -> [ToDoItem] {
        var _toDoItems = [ToDoItem]()
        
        let fetchReqest: NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        do {
            let fetchResult = try getContext().fetch(fetchReqest)
            print("fetched")
            
            for item in fetchResult {
                let _toDoItem = ToDoItem(item.title!, content: item.content!, importance: item.importance!)
                _toDoItems.append(_toDoItem)
            }
            
        } catch {
            print("Fetch All Error:", error.localizedDescription)
        }
        return _toDoItems
    }
    
    class func deleteAllObjs() {
        // MARK: Deleteall
        
        let fetchRequest:NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        do {
            try getContext().execute(deleteRequest)
            print("Delete all")
        } catch {
            print("Delete All Error:",error.localizedDescription)
        }
    }
    
    
    class func fetchObjWithConditions(condition1: String, condition2:String) -> [ToDoItem] {
        var _toDoItems = [ToDoItem]()
        
        let fetchReqest: NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        let predicate = NSPredicate(format: condition1, condition2)
        fetchReqest.predicate = predicate
        
        do {
            let fetchResult = try getContext().fetch(fetchReqest)
            print("condition fetched")
            
            for item in fetchResult {
                let _toDoItem = ToDoItem(item.title!, content: item.content!, importance: item.importance!)
                _toDoItems.append(_toDoItem)
            }
        } catch {
            print("Condition Fetch Error:", error.localizedDescription)
        }
        return _toDoItems
    }
    
    
    class func deleteObjWithCondition(condition1: String, condition2:String) {
         
        
        let fetchRequest:NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        let predicate = NSPredicate(format: condition1, condition2)
        fetchRequest.predicate = predicate
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        do {
            try getContext().execute(deleteRequest)
            print("Condition Delete")
        } catch {
            print("Condition Delete Error:",error.localizedDescription)
        }
    }

    
}
