//
//  WikiViewController.swift
//  StarWars
//
//  Created by Alicia Daza on 28/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {

    // MARK: - Properties
    var model : StarWarsCharacter
    
    @IBOutlet weak var browser: UIWebView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
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
        // Assign delegate
        self.browser.delegate = self
        
        activityView.startAnimating()
        
        browser.loadRequest(NSURLRequest(URL: model.url))
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Subscribe notification
        let nc = NSNotificationCenter.defaultCenter()
        
        // My version
        nc.addObserver(self, selector: "characterDidChange", name: CharacterDidChangeNotification, object: nil)
        
        // New version
        //nc.addObserver(self, selector: @selector(characterDidChange), name: CharacterDidChangeNotification, object: nil)
        
        syncModelWithView()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Unsubscribe from all notifications
        let nc = NSNotificationCenter.defaultCenter()
        nc.removeObserver(self)
        
    }
    
    func characterDidChange(notification: NSNotification) {
        
        // Get user info
        let info = notification.userInfo!
        
        // Get Character
        let char = info[CharacterKey] as? StarWarsCharacter
        
        // Reload model
        model = char!
        
        // Syncronize views
        syncModelWithView()
    }
    

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    		
    
    // MARK: - UIWebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView) {
        // Stop activity view
        activityView.stopAnimating()
        
        // Hide it
        activityView.hidden = true
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if navigationType == .LinkClicked ||
            navigationType == .FormSubmitted {
            
                return false
        } else {
            return true
        }
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
