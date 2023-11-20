//
//  User+CoreDataProperties.swift
//  practiceCoreData
//
//  Created by Bowon Han on 11/9/23.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var signupDate: Date?
    @NSManaged public var devices: [String]?
    @NSManaged public var id: Int64

}
