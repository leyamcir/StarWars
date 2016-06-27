//
//  StarWarsUniverse.swift
//  StarWars
//
//  Created by Alicia Daza on 23/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import UIKit

class StarWarsUniverse {
    
    //MARK: Utility types
    typealias StarWarsArray = [StarWarsCharacter]
    typealias StarWarsDictionary = [StarWarsAffiliation: StarWarsArray]

    // MARK: Utils
    func makeEmptyAffiliations() -> StarWarsDictionary {
        var d = StarWarsDictionary()
        
        d[.rebelAlliance] = StarWarsArray()
        d[.galacticEmpire] = StarWarsArray()
        d[.firstOrder] = StarWarsArray()
        d[.jabbaCriminalEmpire] = StarWarsArray()
        d[.unknown] = StarWarsArray()
        
        return d
    }
}
