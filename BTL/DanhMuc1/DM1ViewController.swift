//
//  DM1ViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 07/03/2022.
//

import UIKit

class DM1ViewController: UIViewController {
    
    
    @IBOutlet weak var searchDM1: UISearchBar!
    
    @IBOutlet weak var nameOrder: UICollectionView!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    
    var arrSP : [SanPham] = [SanPham(image: "anh1", name: "Gạch granite trắng khói:", price: "250.000", size: "800mmx800mm"),
                             SanPham(image: "anh2", name: "Gạch granite đỏ vân đá:", price: "280.000", size: "800mmx800mm"),
                             SanPham(image: "anh3", name: "Gạch granite men matt:", price: "350.000", size: "600mmx1200mm"),
                             SanPham(image: "anh4", name: "Gạch granite siêu bóng:", price: "350.000",size: "600mmx1200mm"),
                             SanPham(image: "anh5", name: "Gạch granite siêu bóng:", price: "450.000",size: "750mmx1500mm")]
    
    var arrData = [SanPham]()
    
    var nameSort = ["Tất cả", " Giá Cao","Giá thấp"]
    
    var saveData: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrData = arrSP
        
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.navigationBar.backgroundColor = .white
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "SecondCollectionViewCellDM1", bundle: nil), forCellWithReuseIdentifier: "productCell")
        
        nameOrder.delegate = self
        nameOrder.dataSource = self
        nameOrder.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "nameOrderCell")
        
        searchDM1.delegate = self
    }
    
    
}
extension DM1ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView {
            return arrData.count
        } else {
            return nameSort.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productCollectionView {
            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! SecondCollectionViewCellDM1
            cell.productImage.image = UIImage(named: "\(arrData[indexPath.row].image)")
            cell.productInfoLabel.text = arrData[indexPath.row].name
            cell.sizeLabel.text = arrData[indexPath.row].size
            cell.priceLabel.text = "\(arrData[indexPath.row].price) VND/m2"
            return cell
        } else {
            let cell = nameOrder.dequeueReusableCell(withReuseIdentifier: "nameOrderCell", for: indexPath) as! FirstCollectionViewCell
            cell.nameOrderLabel.text = nameSort[indexPath.row]
            if saveData == indexPath.row {
                cell.backgroundColor = .brown
                cell.nameOrderLabel.textColor = .white
            } else {
                cell.backgroundColor = .white
                cell.nameOrderLabel.textColor = .black
            }
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollectionView {
            let width = productCollectionView.bounds.width / 2
            return CGSize(width: width, height: width * 1.2)
            
        } else {
            let width = (nameOrder.bounds.width - 30) / 4
            let height = (nameOrder.bounds.height - 10) / 2
            return CGSize(width: width, height: height)

        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == productCollectionView {
            return 0
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == productCollectionView {
            return 0
        }
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productCollectionView {
            let PopVC = DetailsViewController()
            AppDelegate.historyData.append(arrData[indexPath.row])
            navigationController?.pushViewController(PopVC, animated: true)
            
        }else {
            switch indexPath.row {
            case 0:
                arrData = arrData.sorted { item1, item2 in
                    item1.name < item2.name
                }
            case 1:
                arrData = arrData.sorted { item1, item2 in
                    item1.price > item2.price
                }
            case 2:
                arrData = arrData.sorted { item1, item2 in
                    item1.price < item2.price
                }
            default:
                break
            }
            saveData = indexPath.row
            productCollectionView.reloadData()
            nameOrder.reloadData()
        }
    }
    

    
}
extension DM1ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty ?? true {
            arrData = arrSP
        } else {
            arrData = arrSP.filter({ item in
                item.name.lowercased().contains(searchBar.text?.lowercased() ?? "")
            })
        }
        productCollectionView.reloadData()
        print(searchBar.text)
        view.endEditing(true)
    }
}

