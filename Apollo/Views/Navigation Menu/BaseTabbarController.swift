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
    
        setUpTabbar()
        tabBar.backgroundColor = .white
        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = ["house", "person"]
        
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
    }
    
    func setUpTabbar(){
        let sb = UIStoryboard.init(name: "Home", bundle: nil)
        let homeVC = sb.instantiateViewController(withIdentifier: "home") as! HomeViewController
        homeVC.title = "Home"
        
        let sbInfo = UIStoryboard.init(name: "Info", bundle: nil)
        let infoVC = sbInfo.instantiateViewController(withIdentifier: "Info") as! InfoViewController
        infoVC.title = "Info"
        
        let TabhomeVC = UINavigationController(rootViewController: homeVC)
        let TabinfoVC = UINavigationController(rootViewController: infoVC)
        viewControllers = [TabhomeVC,TabinfoVC]
    }
    
}
