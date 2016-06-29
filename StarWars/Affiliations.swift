//
//  Affiliations.swift
//  StarWars
//
//  Created by Alicia Daza on 23/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import Foundation

enum StarWarsAffiliation : String {
    
    case galacticEmpire = "Galactic Empire"
    case rebelAlliance = "Rebel Alliance"
    case firstOrder = "First Order"
    case jabbaCriminalEmpire = "Jabba's Criminal Empire"
    case unknown = "Unknown"

    static func byName(name: String) -> StarWarsAffiliation {
        let aff: StarWarsAffiliation
        
        switch name {
            case "Galactic Empire":
                aff = .galacticEmpire
            case "Rebel Alliance":
                aff = .rebelAlliance
            case "Jabba's Criminal Empire":
                aff = .jabbaCriminalEmpire
            case "First Order":
                aff = .firstOrder
            default:
            aff = .unknown
        }
        
        return aff
    }
    
    static func byName(name: String?) -> StarWarsAffiliation {
        guard case .Some(let affiliationName) = name else {
            return .unknown
        }
        
        return byName(affiliationName)
    }
}