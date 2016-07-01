//
//  UniverseViewController.swift
//  StarWars
//
//  Created by Alicia Daza on 29/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import UIKit

let CharacterDidChangeNotification = "Selected Character did change"
let CharacterKey = "key"

class UniverseViewController: UITableViewController {
    
    // MARK: - Properties
    let model : StarWarsUniverse
    // cannot use this let if using storyboard
    
    var delegate : UniverseViewControllerDelegate?
  
    // MARK - Initialization
    init (model: StarWarsUniverse) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
        // Get character
        let char = character(forIndexPath: indexPath)
        
        // Push
        delegate?.universeViewController(self, didSelectCharacter: char)
        
        // Send same info via notifications
        let nc = NSNotificationCenter.defaultCenter()
        let notif = NSNotification(name: CharacterDidChangeNotification, object: self, userInfo: [CharacterKey: char])
        nc.postNotification(notif)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Affiliations in universe number
        return model.affiliationCount
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Characters number in affiliation
        return model.characterCount(forAffiliation: getAffiliation(forSection: section))
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Cell type
        let cellId = "StarWarsCell"
        
        let character = model.character(atIndex: indexPath.row, forAffiliation: getAffiliation(forSection: indexPath.section))
        
        // Create cell
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        
        if cell == nil {
            // Optional empty, create
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        }
        
        // Syncronyze character and cell
        cell?.imageView?.image = character.photo
        cell?.textLabel?.text = character.alias
        cell?.detailTextLabel?.text = character.name
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return getAffiliation(forSection: section).rawValue
    }
    
    
    func getAffiliation(forSection section: Int) -> StarWarsAffiliation {
        var aff : StarWarsAffiliation = .unknown
        
        switch section {
        case 0:
            aff = .galacticEmpire
        case 1:
            aff = .rebelAlliance
        case 2:
            aff = .firstOrder
        case 3:
            aff = .jabbaCriminalEmpire
        default:
            aff = .unknown
        }
        
        return aff
    }
    
    
    func character(forIndexPath indexPath: NSIndexPath) -> StarWarsCharacter {
        
        return model.character(atIndex: indexPath.row, forAffiliation: getAffiliation(forSection: indexPath.section))
    }

}


protocol UniverseViewControllerDelegate {

    func universeViewController(vc : UniverseViewController, didSelectCharacter character: StarWarsCharacter)
    
    
}


