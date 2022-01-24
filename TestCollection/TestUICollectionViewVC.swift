//
//  ViewController.swift
//  TestCollection
//
//  Created by zhangzihao on 2021/2/21.
//

import UIKit

class TestUICollectionViewVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    var dataSource = [
        ["name":"地址管理","pic":"Birthdays"],
        ["name":"我的收藏","pic":"Chores"],
        ["name":"账号信息","pic":"Drinks"],
        ["name":"系统设置","pic":"Folder"]
    ]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        dataSource = dataSource + dataSource + dataSource
        
        collectionView.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCellx", for: indexPath) as! TestcollectionViewCell
        let data = dataSource[indexPath.row]
        
        cell.imageView.image = UIImage(named: data["pic"] ?? "")
        cell.titleLabel.text = data["name"] ?? ""
        return cell
    }
}
