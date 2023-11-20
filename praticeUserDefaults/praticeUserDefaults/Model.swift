//
//  Model.swift
//  praticeUserDefaults
//
//  Created by Bowon Han on 11/15/23.
//

import Foundation

//struct Person : Codable{
//    let name : String
//    let age : Int
//}
//
//let person = Person(name: "bowon", age: 22)
//
//let encoder = JSONEncoder()
//if let encoded = try? encoder.encode(person) {
//    UserDefaults.standard.setValue(encoded, forKey: "person")
//}
//
//if let savedData = UserDefaults.standard.object(forKey: "person") as? Data {
//    let decoder = JSONDecoder()
//    if let savedObject = try? decoder.decode(Person.self, from: savedData) {
//        print(savedObject) // Person(name: "bowon", age: 22)
//    }
//}

import Foundation

struct Defaults {
    
    static let (nameKey, addressKey) = ("name", "address")
    static let userSessionKey = "com.save.usersession"
    private static let userDefault = UserDefaults.standard
    
    /**
       - Description - It's using for the passing and fetching
                    user values from the UserDefaults.
     */
    struct UserDetails {
        let name: String
        let address: String
        
        init(_ json: [String: String]) {
            self.name = json[nameKey] ?? ""
            self.address = json[addressKey] ?? ""
        }
    }
    
    /**
     - Description - Saving user details
     - Inputs - name `String` & address `String`
     */
    static func save(_ name: String, address: String){
        userDefault.set([nameKey: name, addressKey: address],
                        forKey: userSessionKey)
    }

    /**
    - Description - Fetching Values via Model `UserDetails` you can use it based on your uses.
    - Output - `UserDetails` model
    */
    static func getNameAndAddress()-> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
        
    /**
    - Description - Clearing user details for the user key `com.save.usersession`
    */
    static func clearUserData(){
        userDefault.removeObject(forKey: userSessionKey)
    }
}
