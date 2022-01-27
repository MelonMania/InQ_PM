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
    static var dummy = [ProjectData(title: "참여중인 프로젝트d단, 이 방법을 사용하기 전에 필수 조건은 스토리보드 상에서 혹은 프로그래밍으로 먼저! 제약조건을 걸어 컴포넌트들의 오토레이아웃을 설정해야 한다. 그리고 위의 heightForRowAt 함수를 오버라이딩 하지 않는다."), ProjectData(title: "관심있는 프로젝트")]
}
