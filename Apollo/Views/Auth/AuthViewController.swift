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
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.hidesWhenStopped = true
        // hide storyboard
        self.hideKeyboardWhenTappedAround()
        
        // Change bg Color
        view.backgroundColor =  self.hexStringToUIColor(hex: Config.bgCode)
        
        btnLogin.layer.cornerRadius = 15
        
        txtEmail.borderStyle = .none
        txtPassword.borderStyle = .none
    }
        
    @IBAction func pushtoNextVC(_ sender: Any) {
        
        // Start Animating and Prevent User click Login unitl function is done
        spinner.startAnimating()
        self.view.isUserInteractionEnabled = false
        
        // Validate email and password is empty or not
        guard txtEmail.text != ""  && txtPassword.text != "" else {
            
            self.spinner.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            // Push Notification
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
                    
                    // Push Tabbar and change Root
                    let mainTab = BaseTabbarController()
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTab)
                }
            }
            else {
                DispatchQueue.main.async {
                    
                    self.spinner.stopAnimating()
                    self.view.isUserInteractionEnabled = true
                    
                    // Notification failed to login
                    let notification = UIAlertController(title: "Nofication", message: "Login Failed, Please Try Again", preferredStyle: .alert)
                    notification.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(notification, animated: true, completion: nil)
                    return

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

