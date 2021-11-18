//
//  CourseViewModel.swift
//  Apollo
//
//  Created by QUANG HUNG on 17/Nov/2021.
//


import Foundation

class CourseViewModel : NSObject {
    
    private var getCourseService = GetCourseService()
    var resData: CourseList!
    var repData: Box<CourseList> = Box(CourseList(data: []))
    override init(){
        super.init()
        self.getCourseData()
    }
    
    func getCourseData(){
        self.getCourseService.getCourse {  res in
            self.repData.value = res
            
        }
    }
}
