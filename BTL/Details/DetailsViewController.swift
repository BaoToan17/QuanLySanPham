//
//  DetailsViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 08/03/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var photoColectionView: UICollectionView!
    
    @IBOutlet weak var contactButton: UIButton!
    
    @IBOutlet weak var pageCotrol: UIPageControl!
    
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactButton.clipsToBounds = true
        contactButton.layer.cornerRadius = 20
        
        photoColectionView.delegate = self
        photoColectionView.dataSource = self
        photoColectionView.register(UINib(nibName: "photoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        photoColectionView.isPagingEnabled = true
        
        pageCotrol.numberOfPages = 3
        pageCotrol.currentPage = 0
        pageCotrol.hidesForSinglePage = true
        
    }
    
    @IBAction func showPopUp(_ sender: Any) {
        let popUp = PopUpViewController()
        popUp.modalPresentationStyle = .overFullScreen
        present(popUp, animated: true)
        
    }
    
    @IBAction func actionSave(_ sender: Any) {
        
    }
    
    
}
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! photoCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = photoColectionView.bounds.width
        let height = photoColectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / UIScreen.main.bounds.width
        pageCotrol.currentPage = Int(index)
    }
    
    
}
