//
//  trangChuViewController.swift
//  BTL
//
//  Created by Bảo Toàn on 01/03/2022.
//

import UIKit

class trangChuViewController: UIViewController {
    
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var anhTCImageView: UIImageView!
    
    @IBOutlet weak var thongBaoCollectionView: UICollectionView!
    
    @IBOutlet weak var firstMenu: UICollectionView!
    
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var arrDM : [DanhMuc] = [DanhMuc(image: "GachLat", name: "Gạch lát"),
                             DanhMuc(image: "GachOp", name: "Gạch ốp"),
                             DanhMuc(image: "GachTrangTri", name: "Gạch trang trí"),
                             DanhMuc(image: "TBVS", name: "Thiết bị vệ sinh"),
                             DanhMuc(image: "ThietKe", name: "Thư viện thiết kế"),
                             DanhMuc(image: "Xe", name: "Xe cộ"),
                             DanhMuc(image: "BDS", name: "Bất động sản")]
    
    
    
    var arrTB : [ThongBao] = [ThongBao(imageTB: "Giaohang", nameTB: "Giao hàng toàn quốc"),
                              ThongBao(imageTB: "CSKH", nameTB: "Chăm sóc khách hàng"),
                              ThongBao(imageTB: "KhuyenMai", nameTB: "Chương trình khuyến mại")]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        firstMenu.dataSource = self
        firstMenu.delegate = self
        firstMenu.register(UINib(nibName: "CollectionViewCellTC2", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
        thongBaoCollectionView.dataSource = self
        thongBaoCollectionView.delegate = self
        thongBaoCollectionView.register(UINib(nibName: "CollectionViewCellTC2", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 25
        
        thongBaoCollectionView.clipsToBounds = true
        thongBaoCollectionView.layer.cornerRadius = 12
        
        searchTextField.delegate = self

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gotoSearchView))
        searchView.addGestureRecognizer(tapGesture)
        searchTextField.isUserInteractionEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func gotoSearchView() {
        let searchVC = TKViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func makeACall() {
            guard let url = URL(string: "tel://12345678"),
                UIApplication.shared.canOpenURL(url) else { return }
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
}
extension trangChuViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == thongBaoCollectionView {
            return arrTB.count
        } else {
            return arrDM.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == thongBaoCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! CollectionViewCellTC2
            cell.menuLabel1.text = arrTB[indexPath.row].nameTB
            cell.menuImage1.image = UIImage(named: arrTB[indexPath.row].imageTB)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! CollectionViewCellTC2
            cell.menuLabel1.text = arrDM[indexPath.row].name
            cell.menuImage1.image = UIImage(named: arrDM[indexPath.row].image)
            return cell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == thongBaoCollectionView {
            let width = thongBaoCollectionView.bounds.width / 3
            let height = thongBaoCollectionView.bounds.height
            return CGSize(width: width, height: height)
        } else {
            let width = firstMenu.bounds.width / 3
            let height = firstMenu.bounds.height / 2
            return CGSize(width: width, height: height)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == thongBaoCollectionView {
            switch indexPath.row {
            case 0:
                if let url = URL(string: "https://hoasenhome.vn/blog/post/chinh-sach-giao-hang") {
                    UIApplication.shared.open(url)
                }
            case 1:
                makeACall()
            default:
                if let url = URL(string: "https://hoasenhome.vn/blog/post/deal-shock-tha-ga-chi-tu-89k") {
                    UIApplication.shared.open(url)
                }
            }
            return
        }
        
        let VC = DM1ViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        VC.title = arrDM[indexPath.row].name
        navigationController?.pushViewController(VC, animated: true)
        //        present(VC, animated: true)
    }
    
    
}

extension trangChuViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
    }
}


