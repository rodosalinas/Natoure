//
//  MainMenuVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 02/07/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    
    var currentList = "ExperienceList"
    var path = "experience"
    
    var isDrawerOpen = false
    @IBOutlet weak var mainMenuContainer: UIView!
    
    
    @IBAction func openExperiencesList(_ sender: Any) {
        currentList = "ExperienceList"
        path = "experience"
        performSegue(withIdentifier: "ExperiencesListSegue", sender: nil)
    }
    
    @IBAction func openHostList(_ sender: Any) {
        currentList = "HostList"
        path = "host"
        performSegue(withIdentifier: "ExperiencesListSegue", sender: nil)
    }
    
    @IBAction func openAICList(_ sender: Any) {
        currentList = "AICList"
        path = "aic"
        performSegue(withIdentifier: "ExperiencesListSegue", sender: nil)
    }
    
    @IBAction func manageDrawer(_ sender: Any) {
        if !isDrawerOpen{
            UIView.animate(withDuration: 0.3, animations: {
                self.mainMenuContainer.frame.origin.x = 0
            })
            isDrawerOpen = true
        }
    }
    
    @IBAction func closeDrawer(_ sender: Any) {
        if isDrawerOpen{
            UIView.animate(withDuration: 0.3, animations: {
                self.mainMenuContainer.frame.origin.x = -self.view.frame.width
            })
            isDrawerOpen = false
        }
    }
    
    override func viewDidLoad() {
        mainMenuContainer.frame.size.width = self.view.frame.width
        mainMenuContainer.frame.size.height = self.view.frame.height - 20
        mainMenuContainer.frame.origin.x = -self.view.frame.width
        mainMenuContainer.frame.origin.y = 20
        self.view.addSubview(mainMenuContainer)
    }
    
    /*@IBAction func exploreAction(_ sender: Any) {
        currentList = "experience"
        self.performSegue(withIdentifier: "listView", sender: self)
    }
    
    @IBAction func conectAction(_ sender: Any) {
        currentList = "host"
        self.performSegue(withIdentifier: "listView", sender: self)
    }
    
    @IBAction func aicAction(_ sender: Any) {
        currentList = "aic"
        self.performSegue(withIdentifier: "listView", sender: self)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ExperiencesListSegue") {
            let listViewController = segue.destination as! DestinationsVC
            //let duration = sender as Double
            listViewController.type = currentList
            listViewController.path = path
        }
    }
    
    
    
}
