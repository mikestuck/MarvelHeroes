//
//  HeroTableViewCell.swift
//  Marvel Hero Index
//
//  Created by Mike Stuck on 4/13/17.
//  Copyright © 2017 Mike Stuck. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

class HeroTableViewCell: UITableViewCell{
    @IBOutlet weak var heroAvatar: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    
    func setupCell(hero: Hero){
        heroName.text = hero.name
        heroAvatar.sd_setImage(with: URL(string: hero.thumbnailURL), placeholderImage: UIImage(named: "placeholder"))
    }
}
