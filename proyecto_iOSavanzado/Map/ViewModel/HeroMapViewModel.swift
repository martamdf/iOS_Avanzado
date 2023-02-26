//
//  HeroMapViewModel.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import Foundation

class HeroMapViewModel: NSObject {
    
    var updateUI: ((_ hero: HeroModel, _ loc: [HeroMapModel]) -> Void)?

    override init() {

    }
    
    func getData(heroe: HeroModel) {
        let apiClient = ApiClient(token: getKeyChainToken())
        apiClient.getLocations(with: heroe.id) { [weak self] loc, error in
            self?.updateUI?(heroe, loc)
        }
    }
}
