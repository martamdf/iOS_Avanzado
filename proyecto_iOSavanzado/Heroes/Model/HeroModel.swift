//
//  HeroModel.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 24/2/23.
//

import Foundation

struct HeroModel: Decodable {

    let id: String
    let name: String
    let description: String
    let photo: String
    var longitud: Double?
    var latitud: Double?
    
}
