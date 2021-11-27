//
//  MainViewModel.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/26/21.
//

import Foundation
class MainViewModel:NSObject{
    private(set) var items : [Items]?
    var coordinator: MainCoordinator?
    private var apiService : APIClient!
    var bindItemsToController : (() -> ()) = {}
    
    override init(){
        super.init()
        self.apiService =  APIClient()
        getItems()
    }
    
    func getItems(){
        apiService.getItems{response in
            LoadingView.shared.stopAnimatimating()
            switch response.result{
            case .success(let main):
                self.items = main.items
                self.searchFavouriteItems()
            case .failure(let error):
                AlertDialogHelper.sharedInstance.alertWindow(title: "error".localized(), message: error.localizedDescription,navigation: self.coordinator!.navigationController)
            }
        }
    }
    
    
    
    func searchFavouriteItems(){
        do{
            try dbQueue.read{db in
                let results = try Items.fetchAll(db)
                if let items = items {
                    for (indx,item) in items.enumerated(){
                        if (results.firstIndex(where: {$0.short_url == item.short_url}) != nil){
                            self.items?[indx].isFavourite = true
                        }else{
                            self.items?[indx].isFavourite = false
                        }
                    }
                }
            }
        }catch{
            print("Database \(error)")
        }
        bindItemsToController()
    }
    
    func bookMarkItem(add:Bool ,indx:Int){
        do {
            try dbQueue.write { db in
                if add{
                    items?[indx].isFavourite = true
                    try! items?[indx].insert(db)
                }else{
                    items?[indx].isFavourite = false
                    try! Items.deleteOne(db, id: (items?[indx].id)!)
                }
            }
        } catch {
            print("Database \(error)")
        }
    }
}
