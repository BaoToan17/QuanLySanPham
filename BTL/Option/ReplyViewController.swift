//
//  ReplyViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 09/03/2022.
//

import UIKit

class ReplyViewController: UIViewController {
        
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Phản hồi"
        sendButton.clipsToBounds = true
        sendButton.layer.cornerRadius = 20
        commentsTextView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
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
extension ReplyViewController: UITextViewDelegate {
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        view.endEditing(true)
    }
}
