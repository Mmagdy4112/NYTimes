//
//  BookMarksDataSource.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/27/21.
//

import UIKit

class BookMarksDataSource<CELL : UICollectionViewCell,T> : NSObject, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    private var cellIdentifier : String!
    var items : [T]?
    var configureCell : (CELL, T?) -> () = {_,_ in }
    var didSelectItem: ((Int) -> Void)?

    
    init(cellIdentifier : String, items : [T]?, configureCell : @escaping (CELL, T?) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items?[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem!(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let numberofCoulmns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let extraSpaceWidth = (numberofCoulmns - 1) * flowLayout.minimumInteritemSpacing
        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
        let width = Int((collectionViewWidth - extraSpaceWidth - inset) / numberofCoulmns)
        return CGSize(width: width, height: width)
    }
    
}
