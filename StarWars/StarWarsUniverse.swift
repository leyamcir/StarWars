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
    
    
    init(){
        // TODO:
        // Load two JSON data
        
        
    }
    
    var affiliationCount : Int {
        get {
            // TODO: Get affiliations count
            return 0
        }
    }
    
    func characterCount(forAffiliation affiliation: StarWarsAffiliation) -> Int {
        // TODO:
        // Get characters for this affiliation
    }
    
    func character(atIndex index: Int, forAffiliation affiliation: StarWarsAffiliation) -> StarWarsCharacter {
        //TODO
        // Character at index position in affiliation
    }
    
    func affiliationName(affiliation: StarWarsAffiliation) -> String {
        
    }

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
