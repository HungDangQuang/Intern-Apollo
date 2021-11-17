//
//  BaseTabbarController.swift
//  Apollo
//
//  Created by QUANG HUNG on 17/Nov/2021.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        let homeVC = HomeViewController()
//        let InfoVC = InfoViewController()
//
//        // Set title
//        homeVC.title = "home"
//        InfoVC.title = "info"
//        self.setViewControllers([homeVC,InfoVC], animated: true)
        setUpTabbar()
        
    }
    func setUpTabbar(){
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let infoVC = UINavigationController(rootViewController: InfoViewController())
        viewControllers = [homeVC,infoVC]
    }
    
}
