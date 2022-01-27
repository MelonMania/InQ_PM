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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 30
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
        return cell
    }

}



