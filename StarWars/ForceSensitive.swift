//
//  ForceSensitive.swift
//  StarWars
//
//  Created by Alicia Daza on 23/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import Foundation
import UIKit

class ForceSensitive : StarWarsCharacter {

    //MARK: - Stored Properties
    let midichlorians : Int

    //MARK: - Inicialization
    init(firstName : String?, lastName : String?, alias: String?,
        soundData : NSData, photo: UIImage, url: NSURL, affiliation: StarWarsAffiliation, midichlorians: Int){

            // Always self attributes first
            self.midichlorians = midichlorians

            // After all is setted, super can be called
            super.init(firstName: firstName, lastName: lastName,
                alias: alias, soundData: soundData, photo: photo,
                url: url, affiliation: affiliation)
    }

    convenience init(jediWithFirstName: String?,
        lastName: String?,
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        midichlorians: Int) {

            self.init(firstName: jediWithFirstName,
                lastName: lastName,
                alias: alias, soundData: soundData,
                photo: photo,
                url: url,
                affiliation: .rebelAlliance,
                midichlorians: midichlorians)
    }

    convenience init(sithWithFirstName: String?,
        lastName: String?,
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        midichlorians: Int) {

            self.init(firstName: sithWithFirstName,
                lastName: lastName,
                alias: alias, soundData: soundData,
                photo: photo,
                url: url,
                affiliation: .galacticEmpire,
                midichlorians: midichlorians)
    }

    // MARK: -  Proxies
    override var proxyForComparison: String {
        get {
            return "\(super.proxyForComparison)\(midichlorians)"
        }
    }

    override var proxyForSorting: String {
        get {
            let isSith = ((affiliation == .galacticEmpire) ||
                (affiliation == .firstOrder)) ? "S" : "J"

            return "\(isSith)\(midichlorians)\(super.proxyForSorting)"
        }
    }
}




