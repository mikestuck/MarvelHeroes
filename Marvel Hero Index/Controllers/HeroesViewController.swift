//
//  HeroesViewController.swift
//  Marvel Hero Index
//
//  Created by Mike Stuck on 4/11/17.
//  Copyright © 2017 Mike Stuck. All rights reserved.
//

import Foundation
import UIKit

class HeroesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var heroesTable: UITableView!
    
    var heroArray = [Hero]()
    
    override func viewDidLoad() {
        heroesTable.dataSource = self
        heroesTable.delegate = self
        APIUtil.getHeros(){ responseObject in
            self.heroArray = responseObject
            self.heroesTable.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row > self.heroArray.count-15){
            if(!APIUtil.isCollecting){
                APIUtil.index = APIUtil.index+1
                APIUtil.getHeros(){ responseObject in
                    for hero in responseObject{
                        self.heroArray.append(hero)
                    }
                    self.heroesTable.reloadData()
                }
            }
        }
        let cell : HeroTableViewCell = heroesTable.dequeueReusableCell(withIdentifier: "heroesCell") as! HeroTableViewCell
        cell.setupCell(hero: heroArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HeroDetail", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "HeroDetailVC") as? HeroDetailViewController
        let hero = self.heroArray[indexPath.row]
        detailVC?.title = hero.name
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
