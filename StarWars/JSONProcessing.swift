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
func decode(starWarsCharacter json: JSONDictionary) throws -> StarWarsCharacter {

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
    soundURL = NSBundle.mainBundle().URLForResource(soundName),
        sound = NSData(contentsOfURL: soundURL) else {
            throw StarWarsError.resourcePointedByUrLNotReachable
    }

    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    let alias = json["alias"] as? String

    if let affiliation = json["affiliation"] as? String {
        return StarWarsCharacter(firstName: firstName, lastName: lastName, alias: alias, soundData: sound, photo: image, url: url, affiliation: StarWarsAffiliation.byName(affiliation))
    } else {
        throw StarWarsError.wrongJSONFormat
    }

}


func decode(starWarsCharacter json: JSONDictionary?) throws -> StarWarsCharacter {

    if case .Some(let jsonDict) = json {
        return try decode(starWarsCharacter: jsonDict)
    } else {
        throw StarWarsError.nilJSONObject
    }

}


func decode(forceSensitive json: JSONDictionary) throws -> ForceSensitive {

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
        soundURL = NSBundle.mainBundle().URLForResource(soundName),
        sound = NSData(contentsOfURL: soundURL) else {
            throw StarWarsError.resourcePointedByUrLNotReachable
    }

    guard let jedi = json["jedi"] as? Bool,
    sith = json["sith"] as? Bool,
        md = json["midichlorians"] as? Int else {

            throw StarWarsError.wrongJSONFormat
    }

    guard jedi != sith else {
        throw StarWarsError.wrongJSONFormat
    }

    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    let alias = json["alias"] as? String

    if let affiliation = json["affiliation"] as? String {

        let aff = StarWarsAffiliation.byName(affiliation)

        if aff == .galacticEmpire {
            return ForceSensitive(sithWithFirstName: firstName, lastName: lastName, alias: alias, soundData: sound, photo: image, url: url, midichlorians: md)
        } else {
            return ForceSensitive(jediWithFirstName: firstName, lastName: lastName, alias: alias, soundData: sound, photo: image, url: url, midichlorians: md)
        }
    } else {
        throw StarWarsError.wrongJSONFormat
    }
}


func decode(forceSensitive json: ForceSensitive?) throws -> ForceSensitive {

    if case .Some(let jsonDict) = json {
        return try decode(forceSensitive: jsonDict)
    } else {
        throw StarWarsError.nilJSONObject
    }
}


// MARK: - Loading
func loadFromLocalFile(fileName name: String, bundle: NSBundle = NSBundle.mainBundle()) throws -> JSONArray {

    if let url = bundle.URLForResource(name),
        data = NSData(contentsOfURL: url),
        maybeArray = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? JSONArray,
        array = maybeArray {

            return array

    } else {
        throw StarWarsError.jsonParsingError
    }
}

