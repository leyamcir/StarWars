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
    
    //MARK: - Properties
    var dict : StarWarsDictionary = StarWarsDictionary()
    
    init (characteres chars: StarWarsArray) {
        // Create empty dictionary
        dict = makeEmptyAffiliations()
        
        // Iterate array and assign depending on affiliation
        for each in chars  {
            dict[each.affiliation]?.append(each)
        }
    }
    
    var affiliationCount : Int {
        get {
            // Get affiliations count
            return dict.count
        }
    }
    
    func characterCount(forAffiliation affiliation: StarWarsAffiliation) -> Int {
        // Get characters for this affiliation
        // Mode 1: safer
        guard let count = dict[affiliation]?.count else {
            return 0
        }
        return count
        
        // Mode 2: by force
        //return (dict[affiliation]?.count)!
        
        // Make sure in all affiliations are, at least an empty array
        // Otherwise, app will crash
    }
    
    func character(atIndex index: Int, forAffiliation affiliation: StarWarsAffiliation) -> StarWarsCharacter {

        // Character at index position in affiliation
        let chars = dict[affiliation]!
        let char = chars[index]
        
        return char
    }
    
    func affiliationName(affiliation: StarWarsAffiliation) -> String {
        return affiliation.rawValue
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
