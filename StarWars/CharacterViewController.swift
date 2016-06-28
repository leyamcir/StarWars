//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Alicia Daza on 27/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    let model: StarWarsCharacter
    
    init(model: StarWarsCharacter) {
        self.model = model
        super.init(nibName: "CharacterViewController", bundle: nil)
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}
