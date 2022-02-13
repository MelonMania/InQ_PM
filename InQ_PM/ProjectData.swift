//
//  ProjectData.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/27.
//

import Foundation

class ProjectData {
    var title : String
    var text : String
    var isExpanded : Bool
    //var projectTitle : String
    //var projectDesc : String
    
    init(title : String, text : String, isExpanded : Bool) {
        self.title = title
        self.text = text
        self.isExpanded = isExpanded
    }
    static var dummy = [ProjectData(title: "참여중인 프로젝트",
                                    text : """
개인프로젝트 1
개인프로젝트 2
개인 프로젝트 3
""", isExpanded: false), ProjectData(title: "관심있는 프로젝트", text : """
해볼까 1
해볼까 2
해볼까 3
""", isExpanded: false)]
}
