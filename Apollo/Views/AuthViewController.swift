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
    
    var accountViewModel: AccountViewModel!
    
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
        
        // Validate
        guard txtEmail.text != ""  && txtPassword.text != "" else {
            
            let notification = UIAlertController(title: "Nofication", message: "Email or Password must not be empty", preferredStyle: .alert)
            notification.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(notification, animated: true, completion: nil)
            return
        }
        
        self.accountViewModel = AccountViewModel()
        
        accountViewModel.callToLogin(email: txtEmail.text!, password: txtPassword.text!) { message in
            print(message)
            if message == "success" {
                DispatchQueue.main.async {
                    let sb = UIStoryboard(name: "Home", bundle: nil)
                    let homeVC = sb.instantiateViewController(withIdentifier: "home")
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
            else {
                DispatchQueue.main.async {
                    let notification = UIAlertController(title: "Nofication", message: "Login failed, please try again", preferredStyle: .alert)
                    notification.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(notification, animated: true, completion: nil)
                }
            }
        }

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

