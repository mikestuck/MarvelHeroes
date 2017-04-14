//
//  UserUtil.swift
//  Marvel Hero Index
//
//  Created by Mike Stuck on 4/11/17.
//  Copyright © 2017 Mike Stuck. All rights reserved.
//

import Foundation

class UserUtil: NSObject{
    
    // MARK: - Setters
    
    static func saveToDefaults(value: AnyObject, key: String){
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    static func removeFromDefaults(key: String){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
    }
    
    // MARK: - Getters
    
    static func checkAndReadFromDefaults(key: String) -> String{
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: key) {
            return name
        }
        return ""
    }
}
