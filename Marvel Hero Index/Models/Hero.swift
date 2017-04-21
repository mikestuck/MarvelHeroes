//
//  Hero.swift
//  Marvel Hero Index
//
//  Created by Mike Stuck on 4/11/17.
//  Copyright © 2017 Mike Stucj. All rights reserved.
//

import Foundation

class Hero: NSObject{
    
    // MARK: - Properties
    
    let id: Int
    let name: String
    let heroDescription: String
    let modified: String
    let resourceURI: String
    let thumbnailDict: NSDictionary
    let thumbnailURL: String
    let comics: [Comic] = []
    let stories: [Story] = []
    let events: [Event] = []
    let series: [Series] = []
    
    
    init(heroDict: NSDictionary) {
        self.id = heroDict.object(forKey: "id") as! Int
        self.name = heroDict.object(forKey: "name") as! String
        self.heroDescription = heroDict.object(forKey: "description") as! String
        self.modified = heroDict.object(forKey: "modified") as! String
        self.resourceURI = heroDict.object(forKey: "resourceURI") as! String
        self.thumbnailDict = heroDict.object(forKey: "thumbnail") as! NSDictionary
        let path = thumbnailDict.object(forKey: "path") as! String
        let ext = thumbnailDict.object(forKey: "extension") as! String
        self.thumbnailURL = path + "/landscape_incredible." + ext
    }
}


