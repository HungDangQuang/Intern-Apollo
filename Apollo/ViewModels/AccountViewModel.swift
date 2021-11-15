//
//  AccountViewModel.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import Foundation
import OpenGLES

class AccountViewModel: NSObject{
    
    private var loginService: LoginService!
    private var email: String!
    private var password: String!
    
    
//    private(set) var resData: ReceivedData!{
//        didSet {
//            self.bindAccountViewModelToController()
//        }
//    }
//    var bindAccountViewModelToController : (() -> ()) = {}
    
//    override init(){
//        super.init()
//
//        self.loginService = LoginService()
//        callToLogin()
//    }
    
    
    init(email:String, password: String){
        super.init()
        
        self.email = email
        self.password = password
        self.loginService = LoginService()
        
        callToLogin()
    }
    
    func callToLogin(){
        self.loginService.login(email: email, password: password) { res in
            print(res)
        }
    }
}
