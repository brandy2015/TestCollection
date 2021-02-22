//
//  ViewController.swift
//  TestCollection
//
//  Created by zhangzihao on 2021/2/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    //push成功
    
    @IBOutlet weak var collectionView: UICollectionView!
    //    var collectionView: UICollectionView!
        
        var dataSource = [
            ["name":"地址管理","pic":"Birthdays"],
            ["name":"我的收藏","pic":"Chores"],
            ["name":"账号信息","pic":"Drinks"],
            ["name":"系统设置","pic":"Folder"]
        ]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
        
        
        dataSource = dataSource + dataSource + dataSource
    }

    /// 设置UI
    func setupUI()
    {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self.view.bounds.size.width - 40) / 3, height: (self.view.bounds.size.width - 40) / 3 + 30)
        
//        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
//        collectionView.register(collectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCellx", for: indexPath) as! collectionViewCell
        let data = dataSource[indexPath.row]
        
        cell.imageView.image = UIImage(named: data["pic"] ?? "")
        cell.titleLabel.text = data["name"] ?? ""
        return cell
    }
}


class collectionViewCell: UICollectionViewCell{
     
     
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
////        imageView = UIImageView()
////        imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.width)
////        imageView.contentMode = .scaleAspectFit
//
////        titleLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.origin.y + imageView.frame.size.width + 10, width: self.bounds.size.width, height: 20))
////        titleLabel.textAlignment = .center
//
////        addSubview(imageView)
////        addSubview(titleLabel)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(frame: .zero)
//    }
    
}
