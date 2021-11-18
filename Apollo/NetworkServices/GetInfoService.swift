//
//  GetInfoService.swift
//  Apollo
//
//  Created by QUANG HUNG on 18/Nov/2021.
//

import Foundation
class GetInfoService: NSObject {
    func getInfo(completion: @escaping(User)->()){
        
        let token = UserDefaults.standard.string(forKey: "accessToken")
        
        if token != nil {
            
            guard let URL = URL(string: Config.serverURL + "/auth/me") else {
                fatalError()
            }
            
                var request = URLRequest(url: URL)
            
                // Set http method
                request.httpMethod = "GET"
            
                // Set HTTP Request Header
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
             
                    if let error = error {
                        
                        print("Error took place \(error)")
                        return
                    }
                    
                let httpResponse = response as! HTTPURLResponse
                
                // Check if the call is successful
                guard 200 ... 299 ~= httpResponse.statusCode else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    return
                }
                
                guard let data = data else {return}
                
                do{
                    
                    let result = try JSONDecoder().decode(User.self, from: data)
                    completion(result)
                    
                }catch let jsonErr{
                    print(jsonErr)
                }
                    
            }
            
                task.resume()
        }
    }
}
