//
//  HomeTabBarController.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 24/2/23.
//
import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTabs()
    }
    
    private func setupTabs(){
        
        let navigationController1 = UINavigationController(rootViewController: HeroesListTableViewController())
        let tabImageFeed = UIImage(systemName: "newspaper")!
        navigationController1.tabBarItem = UITabBarItem(title: "Lista", image: tabImageFeed, tag: 0)
        
        let navigationController2 = UINavigationController(rootViewController: MapViewController())
        let tabImageMap = UIImage(systemName: "mappin.and.ellipse")!
        navigationController2.tabBarItem = UITabBarItem(title: "Mapa", image: tabImageMap, tag: 1)
     
        viewControllers = [navigationController1, navigationController2]//, navigationController3]
    }
    
    private func setupLayout() {
        tabBar.backgroundColor = .systemBackground
    }
}
