//
//  HistoryViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 09/03/2022.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var HistorySearchBar: UISearchBar!
    
    @IBOutlet weak var historyCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Lịch sử"
        
        historyCollection.delegate = self
        historyCollection.dataSource = self
        historyCollection.register(UINib(nibName: "CollectionViewCellTC2", bundle: nil), forCellWithReuseIdentifier: "historyCell")
    }

}
extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyCell", for: indexPath) as! CollectionViewCellTC2
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = historyCollection.bounds.width / 2
        return CGSize(width: width, height: width/106*145)
    }
    
    
}
