//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Alicia Daza on 27/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var photoView: UIImageView!
    
    
    // MARK: - Initialization
    var model: StarWarsCharacter
    
    init(model: StarWarsCharacter) {
        self.model = model
        super.init(nibName: "CharacterViewController", bundle: nil)
    }
    
    func syncModelWithView() {
        // Photo
        photoView.image = model.photo
        
        // Alias
        title = model.name
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Actions
    @IBAction func playSound(sender: AnyObject) {
    }
    
    @IBAction func displayWiki(sender: AnyObject) {
        // Create wikiVC
        let wVC = WikiViewController(model: model)
        
        // Push to NavigationController
        navigationController?.pushViewController(wVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Before view has its dimensions
        // Only once
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Just before showing (after viewDidLoad)
        // Possibly more than once
       
        syncModelWithView()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}


extension CharacterViewController: UniverseViewControllerDelegate {
    func universeViewController(vc: UniverseViewController,
        didSelectCharacter character: StarWarsCharacter) {
            model = character
            
            syncModelWithView()
    }
}


