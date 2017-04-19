//
//  APIUtil.swift
//  Marvel Hero Index
//
//  Created by Mike Stuck on 4/11/17.
//  Copyright © 2017 Mike Stuck. All rights reserved.
//

import Foundation
import Alamofire
import CryptoSwift

class APIUtil: NSObject{
    
    static var index = 0
    static var responseSize = 20
    
    static func getHeros(completionHandler: @escaping ([Hero]) -> ()) {
        var heroArray = [Hero]()
        let timestamp = NSDate().timeIntervalSince1970.description
        let hash = "\(timestamp)\(MARVEL_PRIVATE_KEY)\(MARVEL_PUBLIC_KEY)".md5()
        let offset = index * responseSize
        let params:[String:String] =
            [
                "ts":timestamp,
                "apikey":MARVEL_PUBLIC_KEY,
                "hash": hash,
                "offset": "\(offset)"
        ];
        Alamofire.request("\(API_BASE_URL)characters", method: .get, parameters: params, encoding: URLEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success( _):
                    if let result = response.result.value {
                        let JSON = result as! NSDictionary
                        let data = JSON["data"] as! NSDictionary
                        let results = data["results"] as! NSArray
                        for hero in results{
                            let heroDict = hero as! NSDictionary
                            let heroObj = Hero.init(heroDict: heroDict)
                            heroArray.append(heroObj)
                        }
                    }
                    completionHandler(heroArray)
                case .failure( _):
                    return
                }
        }
    }
}
