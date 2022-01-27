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

}
