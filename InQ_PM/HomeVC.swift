//
//  ViewController.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/27.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var skill: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        infoView.layer.cornerRadius = 30
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectData.dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let target = ProjectData.dummy[indexPath.row]
        
        cell.cellTitle.text = target.title
        cell.frame.size.width = tableView.frame.size.width // tableViewCell 너비 자동 설정
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var heightOfTableView : CGFloat = 0.0
        let cells = self.tableView.visibleCells
        for cell in cells {
            heightOfTableView += cell.frame.height
        }
        
        return heightOfTableView
    }*/
    
    
}



