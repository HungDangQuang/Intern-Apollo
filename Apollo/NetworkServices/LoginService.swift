//
//  LoginService.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import Foundation

class LoginService: NSObject {
    
    
    func login(email: String, password: String, completionHandler: @escaping(Int)->()){
        
        let url = URL(string: Config.serverURL + "/auth/login")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Encode data
        let sData = Account(email: email, password: password, isMobileApp: true)
        let jsonData = try? JSONEncoder().encode(sData)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            print(statusCode)
            

            // Check if the call is successful
            guard 200 ... 299 ~= httpResponse.statusCode else {
                
                completionHandler(statusCode)
                print("Error with the response, unexpected status code")
                return
            }
            
            guard let data = data else {return}
            
            do{
                
                // decode result
                let result = try JSONDecoder().decode(ReceivedData.self, from: data)
                
                // store access token and user ID to userDefaults
                let defaults = UserDefaults.standard
                defaults.set(result.token.accessToken, forKey: "accessToken")
                defaults.set(result.user.id, forKey: "userID")
                completionHandler(statusCode)

            }catch let jsonErr{
                print(jsonErr)
            }
            
        }
        task.resume()
    }
}
