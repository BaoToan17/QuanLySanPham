//
//  TKViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 08/03/2022.
//

import UIKit

class TKViewController: UIViewController {

    @IBOutlet weak var searchCardView: UIView!
    
    @IBOutlet weak var backTKButton: UIButton!
    
    @IBOutlet weak var nameTKLabel: UILabel!
    
    @IBOutlet weak var TKSearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tìm kiếm"
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.backgroundColor = .gray
    }

}
