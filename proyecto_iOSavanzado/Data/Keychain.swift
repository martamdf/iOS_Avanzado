//
//  Keychain.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 26/2/23.
//

import UIKit
import Security


func deleteDataKeyChain() {
    // definimos un usuario
    let username = "user"
    
    // Preparamos la consulta
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: username
    ]
    
    // ejecutamos la consulta para eliminar
    if (SecItemDelete(query as CFDictionary)) == noErr {
        debugPrint("Información del usuario eliminada con éxito")
    } else {
        debugPrint("Se produjo un error al eliminar la información del usuario")
    }
}

func readDataKeyChain() {
    
    // Establecer el usuario que queremos encontrar
    let username = "user"
    
    // Preparamos la consulta
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: username,
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecReturnAttributes as String: true,
        kSecReturnData as String: true
    ]
    
    var item: CFTypeRef?
    
    if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
        
        // extraemos la información
        if let existingItem = item as? [String: Any],
           let username = existingItem[kSecAttrAccount as String] as? String,
           let passwordData = existingItem[kSecValueData as String] as? Data,
           let token = String(data: passwordData, encoding: .utf8) {
            
            debugPrint("La info es: \(username) - \(token)")
            
        }
        
    } else {
        debugPrint("Se produjo un error al consultar la información del usuario")
    }
    
}

func saveDataKeyChain(_ miToken: String) {
    
    // definimos un usuario
    let username = "user"
    let password = miToken.data(using: .utf8)!
    
    // Preparamos los atributos necesarios
    let attributes: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: username,
        kSecValueData as String: password
    ]
    
    // Guardar el usuario
    if SecItemAdd(attributes as CFDictionary, nil) == noErr {
        debugPrint("Información del usuario guardada con éxito")
    } else {
        debugPrint("Se produjo un error al guardar la información del usuario")
    }
    
}


func isKeyChainData() -> Bool {
    
    // Establecer el usuario que queremos encontrar
    let username = "user"
    
    // Preparamos la consulta
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: username,
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecReturnAttributes as String: true,
        kSecReturnData as String: true
    ]
    
    var item: CFTypeRef?
    
    if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
        if item is [String: Any]
        {
            return true
        }
        return false
        
    } else {
        debugPrint("No Hay datos en KeyChain")
        return false
    }
    
}

func getKeyChainToken() -> String {
    
    // Establecer el usuario que queremos encontrar
    let username = "user"
    var token = ""
    
    // Preparamos la consulta
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: username,
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecReturnAttributes as String: true,
        kSecReturnData as String: true
    ]
    
    var item: CFTypeRef?
    
    if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
        
        // extraemos la información
        if let existingItem = item as? [String: Any],
           let passwordData = existingItem[kSecValueData as String] as? Data,
           let retrievedToken = String(data: passwordData, encoding: .utf8)
        {
            token = retrievedToken
        }
    }
    
    return token
    
}



