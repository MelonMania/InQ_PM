//
//  TabBarCollectionViewCell.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/30.
//

import UIKit

class TabBarCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "TabBarCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    func setTitle(title : String) {
        titleLabel.text = title
    }
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = .black
            } else {
                titleLabel.textColor = .lightGray
            }
        }
    }
    
    override func prepareForReuse() {
        isSelected = false
    }
}
