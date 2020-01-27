//
//  FollowerListViewController.swift
//  GHFollowersSACourse
//
//  Created by JohnAnthony on 1/24/20.
//  Copyright © 2020 iJACD. All rights reserved.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
