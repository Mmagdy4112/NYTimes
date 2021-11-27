//
//  ViewController.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/26/21.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController,Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    var mainViewModel : MainViewModel!
    private var dataSource : MainDataSource<StoryCell,Items>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    override func viewWillAppear(_ animated: Bool) {
        if (mainViewModel.items != nil){
            mainViewModel.searchFavouriteItems()
        }else{
            mainViewModel.getItems()
        }
    }
    func callToViewModelForUIUpdate(){
        self.updateDataSource()
        self.mainViewModel.bindItemsToController = {
            DispatchQueue.main.async {
                self.dataSource.items = self.mainViewModel.items
                self.tableView.reloadData()
            }
        }
    }
    func updateDataSource(){
        self.dataSource = MainDataSource(cellIdentifier: String(describing: StoryCell.self), items: self.mainViewModel.items, configureCell: { (cell, item) in
            cell.titleLabel.text = item?.title
            cell.dateLabel.text = Utils.shared.getFormattedDate(item?.created_date)
            if let url = item?.multimedia?[0].url {
                cell.img.sd_setImage(with: URL(string: url))
            }
            cell.bookImg.image = (item?.isFavourite)! ? UIImage(systemName: "book.fill") : UIImage(systemName: "book")
            cell.bookMarkHandler = {
                let indx:Int! = self.tableView.indexPath(for: cell)!.row
                let item:Items! = self.mainViewModel.items?[indx]
                self.mainViewModel.bookMarkItem(add: !item.isFavourite, indx: indx)
                DispatchQueue.main.async {
                    self.dataSource.items = self.mainViewModel.items
                    self.tableView.reloadRows(at: [self.tableView.indexPath(for: cell)!], with: .fade)
                }
            }
        })
        self.dataSource.didSelectItem = {indx in
            
        }
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
            self.tableView.reloadData()
        }
    }
}
