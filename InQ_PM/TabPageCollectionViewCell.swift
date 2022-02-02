//
//  TabPageCollectionViewCell.swift
//  InQ_PM
//
//  Created by RooZin on 2022/02/02.
//

import UIKit

class TabPageCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "TabPageCell"
    lazy var backColor : [UIColor] = [.lightGray, .purple, .orange, .cyan, .magenta]
    
    func setColor(index : Int) {
        self.backgroundColor = backColor[index]
    }
}
