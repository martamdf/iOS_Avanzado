//
//  MapView.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import Foundation
import UIKit
import MapKit

class MapView: UIView {
    
    let map = {
        let map = MKMapView()
        if(system.self)
        map.overrideUserInterfaceStyle = .dark
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMapConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setMapConstraints() {
        addSubview(map)
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: topAnchor),
            map.bottomAnchor.constraint(equalTo: bottomAnchor),
            map.leadingAnchor.constraint(equalTo: leadingAnchor),
            map.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
