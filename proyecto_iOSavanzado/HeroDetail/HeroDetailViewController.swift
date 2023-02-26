//
//  HeroDetailViewController.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 26/2/23.
//

import Foundation
import UIKit

class HeroDetailViewController : UIViewController{
    
    var mainView: HeroDetailView {self.view as! HeroDetailView}
    var hero: Hero?

    init(_ hero: Hero){
        super.init(nibName: nil, bundle: nil)
        self.hero = hero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HeroDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail()
    }
    
    func getDetail() {
        guard let hero = self.hero else { return }
        DispatchQueue.main.async {
            self.mainView.configure(hero)
        }
    }
}
