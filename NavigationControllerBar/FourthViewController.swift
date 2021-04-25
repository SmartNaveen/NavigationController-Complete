//
//  fourthViewController.swift
//  NavigationControllerBar
//
//  Created by Mr. Naveen Kumar on 16/11/19.
//  Copyright © 2019 delta. All rights reserved.
//

import UIKit

protocol DidDismissSecondVCProtocol: class {
    func didDismissSecondVC(_ isDismiss: Bool)
}

class FourthViewController: UIViewController {

    weak var delegate: DidDismissSecondVCProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FourthVC"
        
        let leftbtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popToRoot))
        self.navigationItem.leftBarButtonItem = leftbtn
    }
    

    // Pop to particular Controller
    @objc func popToRoot(){
        for i in self.navigationController?.viewControllers ?? [] {
            if i.isKind(of: SecondViewController.self) {
                self.navigationController?.popToViewController(i, animated: true)
                DispatchQueue.main.async {
                    self.delegate?.didDismissSecondVC(true)
                }
            }
        }
       // self.navigationController?.popToRootViewController(animated: true)
    }
}
