//
//  AuthViewController.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // hide storyboard
        self.hideKeyboardWhenTappedAround()
        
        // Change bg Color
        view.backgroundColor =  self.hexStringToUIColor(hex: Config.bgCode)
        
        btnLogin.layer.cornerRadius = 15
        
        txtEmail.borderStyle = .none
        txtPassword.borderStyle = .none
    }
        
    @IBAction func pushtoNextVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = sb.instantiateViewController(withIdentifier: "home")
        navigationController?.pushViewController(homeVC, animated: true)
    }
}


extension UIViewController {
    
    // hide keyboard
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // input color by hex code
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

