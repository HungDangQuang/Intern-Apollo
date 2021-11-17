//
//  GetCourseService.swift
//  Apollo
//
//  Created by QUANG HUNG on 17/Nov/2021.
//

import Foundation

class GetCourseService: NSObject {
    func getCourse(completionHandler: @escaping(CourseList)->()){
        //get URL
        let url = URL(string: Config.serverURL + "/class")

        // guard url is valid
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)

        // Set http method
        request.httpMethod = "GET"

        // Get token
        let token = UserDefaults.standard.string(forKey: "accessToken")

        // Set HTTP Request Header
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Check if the call is succeessful
            guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                
                // Show notification to users
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
              }
            // guard we have data
            guard let jsonData = data else {
                print(data!)
                return

            }

            let decoder = JSONDecoder()

            do {

                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(CourseList.self, from: jsonData)
                completionHandler(result)
                
            } catch {
                print(error.localizedDescription)
                debugPrint(error)
            }
        }
        task.resume()
    }
    
}
