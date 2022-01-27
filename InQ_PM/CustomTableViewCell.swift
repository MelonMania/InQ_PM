//
//  TableViewCell.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/27.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configure()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    func configure() {
        selectionStyle = .none
        
        contentView.layer.cornerRadius = 8
        contentView.layer.backgroundColor = UIColor.systemMint.cgColor
    }
}
