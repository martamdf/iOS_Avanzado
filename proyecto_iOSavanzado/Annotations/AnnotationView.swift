//
//  AnnotationView.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import Foundation

import MapKit

class AnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let value = newValue as? Annotation else { return }
            detailCalloutAccessoryView = Callout(annotation: value)
            
            let pinImage = UIImage(named: "pin.png")
            let size = CGSize(width: 40, height: 40)
            UIGraphicsBeginImageContext(size)
            pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            
            // Añadimos la imagen
            self.image = resizedImage
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
}
