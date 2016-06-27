//
//  JSONProcessing.swift
//  StarWars
//
//  Created by Alicia Daza on 27/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Aliases
typealias JSONObject = AnyObject
typealias JSONDictionary = [String: JSONObject]
typealias JSONArray = [JSONDictionary]

// MARK: - Decodification
func decode(StarWarsCharacter json: JSONDictionary) throws -> StarWarsCharacter {
    
    // Validate dictionary
    guard let urlString = json["url"] as? String,
    url = NSURL(string: urlString) else {
        throw StarWarsError.wrongURLFormatForJSONResource
    }
    
    guard let imageName = json["imageFile"] as? String,
        image = UIImage(named: imageName) else {
        
            throw StarWarsError.resourcePointedByUrLNotReachable
    }
    
    guard let soundName = json["soundFile"] as? String,
    

}