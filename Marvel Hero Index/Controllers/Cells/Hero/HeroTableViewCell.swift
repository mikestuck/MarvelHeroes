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
    @IBOutlet weak var gradientView: UIView!
    
    let gradientLayer = CAGradientLayer()
    
    func setupCell(hero: Hero){
        heroName.text = hero.name
        
        gradientLayer.frame = gradientView.bounds
        let color1 = UIColor(white: 0.0, alpha: 0.7).cgColor as CGColor
        let color2 = UIColor(white: 0.0, alpha: 0.2).cgColor as CGColor
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        gradientView.layer.addSublayer(gradientLayer)
        
        heroAvatar.sd_setImage(with: URL(string: hero.thumbnailURL), placeholderImage: UIImage(named: "placeholder"))
    }
}
