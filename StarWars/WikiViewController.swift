//
//  WikiViewController.swift
//  StarWars
//
//  Created by Alicia Daza on 28/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    // MARK: - Properties
    var model : StarWarsCharacter
    
    @IBOutlet weak var browser: UIWebView!
    
    
    // MARK: - Initialization
    init(model: StarWarsCharacter) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Syncing
    func syncModelWithView() {
        browser.loadRequest(NSURLRequest(URL: model.url))
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
