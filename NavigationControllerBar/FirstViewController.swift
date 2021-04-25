//  ViewController.swift
//  NavigationControllerBar
//  Created by Mr. Naveen Kumar on 15/11/19.
//  Copyright © 2019 delta. All rights reserved.


import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            //            vc.titleString = "Second Controllerr"
            
            let nav = UINavigationController(rootViewController: secondVC)
            self.present(nav, animated: true, completion: nil)
            
            //            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
    
    
}

