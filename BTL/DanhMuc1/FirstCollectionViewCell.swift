//
//  FirstCollectionViewCell.swift
//  BTL
//
//  Created by Bảo Toàn on 08/03/2022.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameOrderLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.backgroundColor = .brown
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        
    }

}
