//
//  CollectionViewCellTC2.swift
//  BTL
//
//  Created by Bảo Toàn on 06/03/2022.
//

import UIKit

class CollectionViewCellTC2: UICollectionViewCell {

    @IBOutlet weak var menuImage1: UIImageView!
    
    @IBOutlet weak var menuLabel1: UILabel!
    
    @IBOutlet weak var heghtLabel: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuImage1.clipsToBounds = true
        menuImage1.layer.cornerRadius = 12
        
        
    }

}
