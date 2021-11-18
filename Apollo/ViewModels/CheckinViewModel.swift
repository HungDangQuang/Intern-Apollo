//
//  CheckinViewModel.swift
//  Apollo
//
//  Created by QUANG HUNG on 18/Nov/2021.
//

import Foundation

class CheckinViewModel: NSObject {
    
    var message = Box("")
    
    private var checkinService = CheckinService()
    
    func scanQRCode(courseCode: String, QRCode: String){
        self.checkinService.checkin(courseCode: courseCode, QRCode: QRCode) { res in
            
            // Check Status Code
            if 200...299 ~= res {
                self.message.value = "success"
            }
            else {
                self.message.value = "failure"
            }
        }
    }
}
