//
//  HeaderCell.swift
//  Tag List collection view
//
//  Created by Pawan kumar on 16/02/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

protocol HeaderCellDelegate: class {
    
     func headerSeeMoreTap(_ sender: HeaderCell)
}

class HeaderCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    weak var delegate: HeaderCellDelegate?
    
    static var reuseIdentifierString: String = "HeaderCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func seeMoreButtonTap(_ sender: Any) {
        
        //Callback Usign Delegate
        delegate?.headerSeeMoreTap(self)
    }
    
}
