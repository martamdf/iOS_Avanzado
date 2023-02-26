//
//  HeroCoreData.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 26/2/23.
//

import Foundation
import CoreData

@objc(Hero)
public class Hero: NSManagedObject {
    
}

public extension Hero {
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<Hero> {
        return NSFetchRequest<Hero>(entityName: "Hero")
    }
    
    @NSManaged var id: String
    @NSManaged var name: String
    @NSManaged var heroDescription: String
    @NSManaged var photo: String
    @NSManaged var latitud: String
    @NSManaged var longitud: String

}

extension Hero : Identifiable {}
