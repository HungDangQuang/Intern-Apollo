//
//  TabItem.swift
//  Apollo
//
//  Created by QUANG HUNG on 17/Nov/2021.
//

import UIKit
enum TabItem: String, CaseIterable {
    case home = "home"
    case info = "info"
    
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .info:
            return InfoViewController()
        }
    }
}
