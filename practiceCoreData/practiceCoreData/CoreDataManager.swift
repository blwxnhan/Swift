//
//  CoreDataManager.swift
//  practiceCoreData
//
//  Created by Bowon Han on 11/9/23.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared : CoreDataManager = CoreDataManager()
    
    let appDelegate : AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "practiceCoreData"
    
    func getUsers(ascending: Bool = false) -> [User] {
        var models : [User] = [User]()
        
        if let context = context {
            let idSort: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: ascending)
            let fetchRequest: NSFetchRequest<NSManagedObject> = 
                NSFetchRequest<NSManagedObject>(entityName: modelName)
            fetchRequest.sortDescriptors = [idSort]
            
            do {
                if let fetchResult : [User] = try context.fetch(fetchRequest) as? [User] {
                    models = fetchResult
                }
                
            } catch let error as NSError {
                print("couldn't not fetch \(error), \(error.userInfo)")
            }
        }
        return models
    }
    
    func saveUser(id: Int64, name: String, age: Int64, date: Date, devices: [String], onSuccess: @escaping ((Bool) -> Void)) {
        if let context = context,
           let entity: NSEntityDescription 
            = NSEntityDescription.entity(forEntityName: modelName, in: context) {
            
            if let user : User = NSManagedObject(entity: entity, insertInto: context) as? User {
                user.id = id
                user.name = name
                user.age = age
                user.signupDate = date
                user.devices = devices
                
                contextSave { success in
                    onSuccess(success)
                }

            }
        }
    }
    
    func deleteUser(id: Int64, onSuccess: @escaping ((Bool) -> Void)) {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = filteredRequest(id: id)
            
            do {
                if let results: [User] = try context?.fetch(fetchRequest) as? [User] {
                    if results.count != 0 {
                        context?.delete(results[0])
                    }
                }
            } catch let error as NSError {
                print("Could not fatch🥺: \(error), \(error.userInfo)")
                onSuccess(false)
            }
            
            contextSave { success in
                onSuccess(success)
            }
        }

    
    
}


extension CoreDataManager {
    fileprivate func filteredRequest(id: Int64) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
            = NSFetchRequest<NSFetchRequestResult>(entityName: modelName)
        fetchRequest.predicate = NSPredicate(format: "id = %@", NSNumber(value: id))
        return fetchRequest
    }
    
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("Could not save🥶: \(error), \(error.userInfo)")
            onSuccess(false)
        }
    }
}






