//
//  Annotation.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let name: String
    let image: String
    
    init(hero: Hero) {
        coordinate = CLLocationCoordinate2D(latitude: Double(hero.latitud)!, longitude: Double(hero.longitud)!) //as! Double)
        
        name = hero.name
        image = hero.photo
    }
}
