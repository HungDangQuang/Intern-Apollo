//
//  InfoViewModel.swift
//  Apollo
//
//  Created by QUANG HUNG on 18/Nov/2021.
//

import Foundation

class InfoViewModel: NSObject {
    private var getInfoService = GetInfoService()
    
    var studentName = Box("")
    var studentNumber = Box("")
    var studentEmail = Box("")

    override init(){
        super.init()
        self.getStudentInfo()
    }
    
    func getStudentInfo(){
        self.getInfoService.getInfo { res in
            
            self.studentName.value = res.name!
            self.studentNumber.value = res.studentCode!
            self.studentEmail.value = res.email!
            
        }
    }
}
