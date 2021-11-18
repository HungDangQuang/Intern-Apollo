//
//  CheckinService.swift
//  Apollo
//
//  Created by QUANG HUNG on 18/Nov/2021.
//

import Foundation
class CheckinService: NSObject {
    func checkin(courseCode: String,QRCode: String,completion: @escaping(Int)->()){
        // get url
        let url = URL(string: Config.serverURL + "/checkin")

        // guard url is valid
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)

        let token = UserDefaults.standard.string(forKey: "accessToken")

        let studentId = UserDefaults.standard.string(forKey: "userID")

        let sData = InfoCheckin(classId: courseCode, studentId: studentId!, qrcode: QRCode)

        // Encode - json file
        let jsonData = try? JSONEncoder().encode(sData)

        // Get http body
        request.httpBody = jsonData

        // Set http method
        request.httpMethod = "POST"

        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                return
            }
            
            let httpResponse = response as! HTTPURLResponse
            print(httpResponse.statusCode)
            let statusCode = httpResponse.statusCode
            
            completion(statusCode)

        }.resume()

    }
}
