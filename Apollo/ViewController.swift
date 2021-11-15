//
//  ViewController.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet weak var email: UITextField!
     
     @IBOutlet weak var password: UITextField!
     
    private var accountViewModel:AccountViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calltoViewModelForLogin()
    }
    
    func calltoViewModelForLogin(){
        self.accountViewModel = AccountViewModel(email: self.email.text!, password: self.password.text!)
    }

}

