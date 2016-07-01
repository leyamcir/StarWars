//
//  AppDelegate.swift
//  StarWars
//
//  Created by Alicia Daza on 21/06/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create model instance
        /*
        let jabbaUrl = NSBundle.mainBundle().URLForResource("jabba.caf")!
        let jabbaSound = NSData(contentsOfURL: jabbaUrl)!
        
        let model = StarWarsCharacter(firstName: "Jabba", lastName: "Desilijic Tiure", 
            alias: "Jabba the Hutt", soundData: jabbaSound, 
            photo: UIImage(named: "jabba.jpg")!, 
            url: NSURL(string: "https://en.wikipedia.org/wiki/Jabba_the_Hutt")!,
            affiliation: .jabbaCriminalEmpire)
*/
        
        // Create window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        do {
            var json = try loadFromLocalFile(fileName: "regularCharacters.json")
            
            json.appendContentsOf(try loadFromLocalFile(fileName: "forceSensitives.json"))
            
            var chars = [StarWarsCharacter]()
            
            for dict in json {
                do {
                    let char = try decode(starWarsCharacter: dict)
                    chars.append(char)
                } catch {
                    print ("Error processing \(dict)")
                }
            }
            
            // can create model
            let model = StarWarsUniverse(characteres: chars)
                
            // Create VC
            let uVC = UniverseViewController(model: model)
                
            // Put in nav
            let uNav = UINavigationController(rootViewController: uVC)
            
            // Create character VC
            let charVC = CharacterViewController(model: model.character(atIndex: 0, forAffiliation: .rebelAlliance))
            
            // put in another navigation
            let charNav = UINavigationController(rootViewController: charVC)
            
            // create splitview with two navs
            let splitVC = UISplitViewController()
            splitVC.viewControllers = [uNav, charNav]
            
            // Assign nav as rootVC
            window?.rootViewController = splitVC
            
            // Assign delegates
            uVC.delegate = charVC
            
            
            // Make visible & key to window
            window?.makeKeyAndVisible()
                
        } catch {
            fatalError("Error while loading json")
        }
        
        /*
        // Create window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Create VC
        let vc = CharacterViewController(model: model)
        
        // Insert in navigation
        let nav = UINavigationController(rootViewController: vc)
        
        // Assign nav as rootVC
        window?.rootViewController = nav

        // Make visible & key to window
        window?.makeKeyAndVisible()
        */
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

