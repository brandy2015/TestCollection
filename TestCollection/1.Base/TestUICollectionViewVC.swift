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
        
        
        let gestrue = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        collectionView.addGestureRecognizer(gestrue)
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
    
    
    @objc func handleLongPressGesture(_ gestrue :UILongPressGestureRecognizer){
        guard let collectionView = collectionView else{
            return
        }
        
        switch gestrue.state {
            case.began:
                guard let targetIndexPath = collectionView.indexPathForItem(at: gestrue.location(in: collectionView)) else{return}
                collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
            case.changed:
                collectionView.updateInteractiveMovementTargetPosition(gestrue.location(in: collectionView))
            case.ended:
                collectionView.endInteractiveMovement()
            default:
                collectionView.cancelInteractiveMovement()
        }
       
    }
    
   
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//
//    }
    
    //Re-Order
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = dataSource.remove(at: sourceIndexPath.row)
        dataSource.insert(item, at: destinationIndexPath.row)
    }
}

//collectionView代理实现
extension TestUICollectionViewVC : UICollectionViewDelegateFlowLayout {
    
//    The problem:
//    UICollectionView was ignoring size instruction. It was sizing the cells to fit its content only.
    //设置单元格尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width     = collectionView.bounds.width
        let cellWidth =  width / 3.0 - 20
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
  
