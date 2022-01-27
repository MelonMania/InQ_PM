//
//  ProjectData.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/27.
//

import Foundation

class ProjectData {
    var title : String
    //var projectTitle : String
    //var projectDesc : String
    
    init(title : String) {
        self.title = title
    }
    static var dummy = [ProjectData(title: "참여중인 프로젝트"), ProjectData(title: "관심있는 프로젝트")]
}
