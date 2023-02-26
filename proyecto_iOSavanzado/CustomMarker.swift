//
//  CustomMarker.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import UIKit
import MapKit

class CustomMarker: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            let pinImage = UIImage(named: "pin.png")
            let size = CGSize(width: 40, height: 40)
            UIGraphicsBeginImageContext(size)
            pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            
            // Añadimos la imagen
            self.image = resizedImage
        }
    }
}
