//
//  HomeTableViewCell.swift
//  InQ_PM
//
//  Created by RooZin on 2022/02/16.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var clippingView: UIView!
    
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var projectId: UILabel!
    @IBOutlet weak var techList: UILabel!
    
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
        clippingView.backgroundColor = UIColor.cyan
        clippingView.layer.masksToBounds = true
        
    }
}
