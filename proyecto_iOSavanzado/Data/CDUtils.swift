//
//  CDUtils.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 26/2/23.
//

import Foundation
import CoreData

var contextHeroes = AppDelegate.sharedAppDelegate.coreDataManager.managedContext

func storeHero(_ id: String, _ name: String, _ heroDescription: String,_ photo: String, _ longitud: String, _ latitud: String) {
    
    let heroe = Hero(context: contextHeroes)
    
    heroe.id = id
    heroe.photo = photo
    heroe.name = name
    heroe.heroDescription = heroDescription
    heroe.latitud = latitud
    heroe.longitud = longitud
 
    
    do {
        try contextHeroes.save()
    } catch let error {
        debugPrint(error)
    }
    
}

func getStoredHeroes() -> [Hero] {
    let heroeFetch: NSFetchRequest<Hero> = Hero.fetchRequest()
    
    do {
        let result = try contextHeroes.fetch(heroeFetch)
        return result
        
    } catch let error as NSError {
        debugPrint("Error -> \(error.description)")
        return []
    }
}


func deleteStoredHeroes() {
    let heroes = try! contextHeroes.fetch(Hero.fetchRequest())
    
    heroes.forEach({ hero in
        contextHeroes.delete(hero)
    })
    do {
        try contextHeroes.save()
        
    } catch let error as NSError {
        debugPrint("Error -> \(error.description)")
    }
    
}



