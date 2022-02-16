//
//  RecruitTableViewCell.swift
//  InQ_PM
//
//  Created by RooZin on 2022/02/15.
//

import UIKit
import Alamofire

class RecruitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var clippingView: UIView!
    
    @IBOutlet weak var projectID: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var techList: UILabel!
    @IBOutlet weak var joinButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.backgroundColor = UIColor.clear
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor(named: "Orange")?.cgColor
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        clippingView.layer.cornerRadius = 10
        clippingView.backgroundColor = UIColor.systemGreen
        clippingView.layer.masksToBounds = true
    }
}
