//
//  HeroesListViewModel.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import Foundation

class HeroesListViewModel: NSObject {
    
    private var apiClient: ApiClient?
    override init() {

    }
    
    var updateUI: ((_ heroesList: [HeroModel]) -> Void)?
    
    func getData() {
        let apiClient = ApiClient(token: getKeyChainToken())
        apiClient.getHeroes { [weak self] heroes, error in
            self?.updateUI?(heroes)
        }
    }
}
