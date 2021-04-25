//  ThirdViewController.swift
//  NavigationControllerBar
//  Created by Mr. Naveen Kumar on 16/11/19.
//  Copyright © 2019 delta. All rights reserved.


import UIKit

protocol ThirdVCProtocol: class {
    func didDismissSecondVC()
}


class ThirdViewController: UIViewController {

    weak var delegate: ThirdVCProtocol?
    
    fileprivate func setupBarButtonItem() {
        //leftbtn
        let leftbtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(leftbarAction))
        self.navigationItem.leftBarButtonItem = leftbtn
        
        //righbtn
        let righbtn = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(righbarAction))
        self.navigationItem.rightBarButtonItem = righbtn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ThirdVC"
        setupBarButtonItem()
    }
    
    
    @objc func leftbarAction() {
        self.dismiss(animated: true, completion: nil)
//         self.navigationController?.popViewController(animated: true)

    }
    @objc func righbarAction()  {
        if let fourthVC = self.storyboard?.instantiateViewController(withIdentifier: "fourthViewController") as? FourthViewController {
            fourthVC.delegate = self
            self.navigationController?.pushViewController(fourthVC, animated: true)
        }
    }

}

// MARK:- Protocol
extension ThirdViewController: DidDismissSecondVCProtocol {
   func didDismissSecondVC(_ isDismiss: Bool) {
       if isDismiss {
        delegate?.didDismissSecondVC()
       }
   }
}
