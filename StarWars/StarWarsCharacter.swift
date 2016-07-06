//
//  StarWarsCharacter.swift
//  StarWars
//
//  Created by Alicia Daza on 21/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import Foundation
import UIKit

 class StarWarsCharacter : Comparable {

    // MARK: Stored properties
    let firstName : String?
    let lastName : String?
    let alias : String?
    let soundData : NSData
    let photo : UIImage
    let url : NSURL
    let affiliation : StarWarsAffiliation

    // MARK: - Computed properties
    var name : String? {
        get {
            guard let first = firstName else {
                return lastName
            }

            guard let last = lastName else {
                return  first
            }

            return "\(first) \(last)"
        }
    }

    //MARK: - Initialization
    init(firstName : String?, lastName : String?, alias: String?,
        soundData : NSData, photo: UIImage, url: NSURL, affiliation: StarWarsAffiliation){

            self.firstName = firstName
            self.lastName = lastName
            self.alias = alias
            self.soundData = soundData
            self.photo = photo
            self.url = url
            self.affiliation = affiliation
    }

    convenience init (alias : String?, soundData: NSData, photo: UIImage,
        url: NSURL, affiliation: StarWarsAffiliation) {
            self.init(firstName : nil, lastName : nil, // sintactic sugar, it's an empty optional
                alias: alias,
                soundData : soundData, photo: photo,
                url: url, affiliation: affiliation)
    }

    //MARK: - Proxies
    var proxyForComparison : String{
        get {
            return "\(firstName)\(lastName)\(alias)\(url)"
        }
    }

    var proxyForSorting: String {
        get {
            return proxyForComparison
        }
    }
}

/*
// MARK: - Extensions
extension StarWarsCharacter {

    var proxyForComparison : String{
        get {
            return "\(firstName)\(lastName)\(alias)\(url)"
        }
    }
}
*/


// MARK: - Equatable
 func ==(lhs: StarWarsCharacter,
    rhs: StarWarsCharacter) -> Bool {

        guard (lhs !== rhs) else {
            return true
        }
    return lhs.proxyForComparison == rhs.proxyForComparison

}

 func <(lhs: StarWarsCharacter,
    rhs: StarWarsCharacter) -> Bool {

        return lhs.proxyForSorting < rhs.proxyForSorting
}

extension StarWarsCharacter : CustomStringConvertible {
    var description : String {
        get{
            if let name = name, alias = alias {
                return "<\(self.dynamicType)\(name) -- \(alias)>"
            }
            return "<\(self.dynamicType)>"
        }
    }
}
