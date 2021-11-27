//
//  BoomarksViewController.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/26/21.
//

import UIKit

class BookMarksViewController: UIViewController ,Storyboarded {
    @IBOutlet weak var collectionView: UICollectionView!
    var bookMarksViewModel : BookMarksViewModel!
    private var dataSource : BookMarksDataSource<StoryCollectionCell,Items>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.bookMarksViewModel.getItemsFromDp()
    }
    func callToViewModelForUIUpdate(){
        self.updateDataSource()
        self.bookMarksViewModel.bindItemsToController = {
            DispatchQueue.main.async {
                self.dataSource.items = self.bookMarksViewModel.items
                self.collectionView.reloadData()
            }
        }
    }
    func updateDataSource(){
        self.dataSource = BookMarksDataSource(cellIdentifier: String(describing: StoryCollectionCell.self), items: self.bookMarksViewModel.items, configureCell: { (cell, item) in
            cell.titleLabel.text = item?.title
            cell.dateLabel.text = Utils.shared.getFormattedDate(item?.created_date)
            if let url = item?.multimedia?[0].url {
                cell.img.sd_setImage(with: URL(string: url))
            }
            cell.bookMarkHandler = {
                let index:IndexPath! = self.collectionView.indexPath(for: cell)
                self.bookMarksViewModel.deleteItem(at:index.row)
                self.dataSource.items = self.bookMarksViewModel.items
                self.collectionView.deleteItems(at:[index])
            }
        })
        self.dataSource.didSelectItem = {indx in
            self.dataSource.didSelectItem = {indx in
                self.bookMarksViewModel.coordinator?.navigateToDetails(item: (self.bookMarksViewModel.items?[indx])!)
            }
        }
        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSource
            self.collectionView.delegate = self.dataSource
            self.collectionView.reloadData()
        }
    }
}
