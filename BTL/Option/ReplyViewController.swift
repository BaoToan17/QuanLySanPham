//
//  ReplyViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 09/03/2022.
//

import UIKit

class ReplyViewController: UIViewController {
    
    @IBOutlet weak var commentsTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Phản hồi"
        
        
        commentsTextField.delegate = self
    }
    
    @IBAction func actionSent(_ sender: Any) {
        let alert = UIAlertController(title: "Đã gửi", message: "Tin nhắn đã gửi thành công", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
            
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
extension ReplyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
