//
//  PopUpViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 20/03/2022.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
    }
    @IBAction func outButton(_ sender: Any) {
        dismiss(animated: true)
    }
    


}
