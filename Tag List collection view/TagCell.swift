//
//  TagCell.swift
//  Tag List collection view
//
//  Created by Pawan kumar on 15/02/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel?
    static var reuseIdentifierString: String = "TagCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

}
