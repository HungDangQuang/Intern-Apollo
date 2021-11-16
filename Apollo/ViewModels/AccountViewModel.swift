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
//    private var email: String!
//    private var password: String!
    
    
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
    
    
    override init(){
        super.init()
        
        self.loginService = LoginService()
 
    }
    
    func callToLogin(email:String, password: String, completionHandler:@escaping(String)->()){
        var message = "none"
        self.loginService.login(email: email, password: password) { res in
            if 200...299 ~= res {
                message = "success"
            }
        completionHandler(message)
    }
}
}
