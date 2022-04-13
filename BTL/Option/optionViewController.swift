//
//  optionViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 09/03/2022.
//

import UIKit

class optionViewController: UIViewController {
    
    
    @IBOutlet weak var firstOption: UIView!
    
    @IBOutlet weak var secondOptionView: UIView!
    
    @IBOutlet weak var thirdOptionView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func actionShare(_ sender: Any) {
        
                let text = "This is some text that I want to share."
                
                let textToShare = [ text ]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                
                activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
                
                self.present(activityViewController, animated: true, completion: nil)

    }
    
    @IBAction func actionHistory(_ sender: Any) {
        let VC = HistoryViewController()
        navigationController?.pushViewController(VC, animated: true)
        
    }
    
    @IBAction func actionReply(_ sender: Any) {
        let VC = ReplyViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
}
