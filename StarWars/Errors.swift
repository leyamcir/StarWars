//
//  Errors.swift
//  StarWars
//
//  Created by Alicia Daza on 27/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import Foundation

// MARK: JSON Errors
enum StarWarsError : ErrorType {
    case wrongURLFormatForJSONResource
    case resourcePointedByUrLNotReachable
    case jsonParsingError
    case wrongJSONFormat
    case nilJSONObject
}
