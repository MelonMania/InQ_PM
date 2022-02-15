//
//  ProceedingProjectVC.swift
//  InQ_PM
//
//  Created by RooZin on 2022/02/15.
//

import UIKit

class ProceedingProjectVC: UIViewController {

    @IBOutlet weak var mytableView: UITableView!
    
    struct ProjectForApply {
        let id : String
        let projectName : String
        let details : String
        let state : String
        let techList : String
    }
    
    let data = [
        ProjectForApply(id: "우진", projectName: "프로젝트 1", details: "소개~~", state: "모집중", techList: "Swift"),
        ProjectForApply(id: "우진", projectName: "프로젝트 2", details: "소개~~", state: "모집중", techList: "Swift"),
        ProjectForApply(id: "우진", projectName: "프로젝트 3", details: "소개~~", state: "모집중", techList: "Swift"),
        ProjectForApply(id: "우진", projectName: "프로젝트 4", details: "소개~~", state: "모집중", techList: "Swift"),
        ProjectForApply(id: "우진", projectName: "프로젝트 1", details: "소개~~", state: "모집중", techList: "Swift"),
        ProjectForApply(id: "우진", projectName: "프로젝트 2", details: "소개~~", state: "모집중", techList: "Swift"),
        ProjectForApply(id: "우진", projectName: "프로젝트 3", details: "소개~~", state: "모집중", techList: "Swift"),
        ProjectForApply(id: "우진", projectName: "프로젝트 4", details: "소개~~", state: "모집중", techList: "Swift")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableView.delegate = self
        mytableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ProceedingProjectVC : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardTableViewCell else {
            fatalError("No CardTableViewCell for cardCell id")
        }
        
        cell.projectID.text = data[indexPath.row].projectName
        cell.detail.text = data[indexPath.row].details
        cell.techList.text = data[indexPath.row].techList
        
        return cell
    }
}
