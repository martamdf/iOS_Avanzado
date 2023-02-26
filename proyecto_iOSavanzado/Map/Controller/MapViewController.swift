//
//  MapViewController.swift
//  IOSAvanzado
//
//  Created by Marta Maquedano on 11/2/23.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var mapView: MapView {self.view as! MapView}
    var locationManager: CLLocationManager?
    
    //var heroesMapList: [HeroMapModel] = []
    var viewModel: HeroMapViewModel?
    
    private(set) var heroesMapList: [Hero] = [] {
        didSet {
            DispatchQueue.main.async {
                debugPrint("Hola")
                self.mapView.map.reloadInputViews()
                debugPrint("Adios")
            }
        }
    }
    
    private var heroeMapViewModel: HeroMapViewModel?
    
    override func loadView() {
        view = MapView()
    }
    
    let initialLatitude = 51.0
    let initialLongitude = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        
        // ojo con esto!! Repasar
        mapView.map.delegate = self
        mapView.map.showsUserLocation = true
        mapView.map.mapType = .standard
        
        heroesMapList = getStoredHeroes()
        
        moveToCoordinates(self.initialLatitude, self.initialLongitude)
        mapView.map.register(CustomMarker.self, forAnnotationViewWithReuseIdentifier: "pepepe")
        
        let annotations = heroesMapList.map { hero in
            return Annotation(hero: hero)
        }
        mapView.map.showAnnotations(annotations, animated: true)
        
    }
    
    
    func moveToCoordinates(_ latitude: Double, _ longitude: Double){
        
        let center = CLLocationCoordinate2D(latitude: latitude,
                                            longitude: longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 40, // esto es para jugar con el zoom
                                    longitudeDelta: 60) // esto es para jugar con el zoom
        
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.map.setRegion(region, animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        debugPrint("annotation -> \(annotation)")
        
        let id = MKMapViewDefaultAnnotationViewReuseIdentifier
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: id)
        
        if let annotation = annotation as? Annotation {
            annotationView?.canShowCallout = true
            annotationView?.detailCalloutAccessoryView = Callout(annotation: annotation)
            
            return annotationView
        }
        
        return nil
    }
}


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if #available(iOS 14.0, *) {
            switch manager.authorizationStatus {
            case .notDetermined:
                debugPrint("Not determined")
            case .restricted:
                debugPrint("restricted")
            case .denied:
                debugPrint("denied")
            case .authorizedAlways:
                debugPrint("authorized always")
            case .authorizedWhenInUse:
                debugPrint("authorized when in use")
            @unknown default:
                debugPrint("Unknow status")
            }
        }
    }
    
    // iOS 13 y anteriores
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch manager.authorizationStatus {
        case .notDetermined:
            debugPrint("Not determined")
        case .restricted:
            debugPrint("restricted")
        case .denied:
            debugPrint("denied")
        case .authorizedAlways:
            debugPrint("authorized always")
        case .authorizedWhenInUse:
            debugPrint("authorized when in use")
        @unknown default:
            debugPrint("Unknow status")
        }
        
    }
}

