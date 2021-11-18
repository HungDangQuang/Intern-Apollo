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
    
    func getMessage(){
        self.checkinService.checkin(courseCode: <#T##String#>, QRCode: <#T##String#>, completion: <#T##(Int) -> ()#>)
    }
}
