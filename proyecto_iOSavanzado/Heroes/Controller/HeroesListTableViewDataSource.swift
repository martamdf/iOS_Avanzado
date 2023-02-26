//
//  HeroesListTableViewDataSource.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 24/2/23.
//

import Foundation
import UIKit

class HeroesListTableViewDataSource : NSObject, UITableViewDataSource {
    
    private let tableView: UITableView
    
    // Aquí cada vez que se actualice la lista de heroes, se producirá el refresco de la tabla
    private(set) var heroes: [Hero] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, heroes: [Hero] = []) {
        self.tableView = tableView
        self.heroes = heroes
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint(heroes.count)
        return heroes.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeListViewCell", for: indexPath) as! HeroeListViewCell
        
        let hero = heroes[indexPath.row]
        cell.configure(hero)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func set(heroes: [Hero]) {
        self.heroes = heroes
    }
}
