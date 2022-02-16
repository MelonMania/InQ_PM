//
//  ViewController.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/27.
//

import UIKit

class HomeVC: UIViewController {
    
    var projectManager = ProjectManager()
    var userManager = UserManager()
    
    var projectData : [ProjectData] = []
    
    let refresh = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var skill: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        projectManager.delegate = self
        userManager.delegate = self
       
        //tableView.rowHeight = UITableView.automaticDimension
        
        infoView.layer.cornerRadius = 30
        self.initRefresh()
    }
    
}

//MARK: - ProjectManagerDelegate

extension HomeVC : ProjectManagerDelegate, UserManagerDelegate {
    func adoptCurrentUser(_ member: MemberData) {
        print("멤버 :\(member)")
    }
    
    
    func updateProjectList(_ data: [ProjectData]) {
        projectData = data
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        
        let target = projectData[indexPath.row]
       
        switch (target.state) {
        case "RECRUIT":
            cell.state.text = "모집중"
        case "FIN":
            cell.state.text = "완료"
        case "ING":
            cell.state.text = "진행중"
        default :
            cell.state.text = "구분X"
        }
        
        cell.projectId.text = target.projectName
        cell.techList.text = target.techList
        cell.frame.size.width = tableView.frame.size.width // tableViewCell 너비 자동 설정
        return cell
    }
}

//MARK: - RefreshControl
extension HomeVC {
    func initRefresh() {
            refresh.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
            refresh.backgroundColor = UIColor.clear
            self.tableView.refreshControl = refresh
        }
     
        @objc func refreshTable(refresh: UIRefreshControl) {
            print("refreshTable")
            projectManager.loadProjectList()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.tableView.reloadData()
                refresh.endRefreshing()
            }
        }
     
        //MARK: - UIRefreshControl of ScrollView
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            if(velocity.y < -0.1) {
                self.refreshTable(refresh: self.refresh)
            }
        }
}


