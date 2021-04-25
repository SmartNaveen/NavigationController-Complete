//
//  SecondViewController.swift
//  NavigationControllerBar
//
//  Created by Mr. Naveen Kumar on 16/11/19.
//  Copyright © 2019 delta. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    fileprivate func setUIBarButtonItem() {
        //leftbtn
        let leftbtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(leftBarAction))
        self.navigationItem.leftBarButtonItem = leftbtn
        
        //righbtn
        let rightbtn = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(rightbtnAction))
        self.navigationItem.rightBarButtonItem = rightbtn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondVC"
        setUIBarButtonItem()
    }
    
    @objc func leftBarAction()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func rightbtnAction() {
        if let tvc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
            self.present(tvc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func pushToThird(_ sender: UIButton) {
        if let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
            thirdVC.delegate = self
            self.navigationController?.pushViewController(thirdVC, animated: true)
        }
    }

}


 // MARK:- Protocol
extension SecondViewController: ThirdVCProtocol {
    func didDismissSecondVC() {
        self.dismiss(animated: true, completion: nil)
    }

}
