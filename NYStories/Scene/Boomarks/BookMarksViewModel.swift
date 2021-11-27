//
//  BoomarksViewModel.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/26/21.
//

import Foundation
class BookMarksViewModel:NSObject{
    private(set) var items : [Items]?
    var coordinator: MainCoordinator?
    var bindItemsToController : (() -> ()) = {}
    
    override init(){
        super.init()
        getItemsFromDp()
        
    }
    func deleteItem(at:Int){
        do {
            try dbQueue.write { db in
                try! Items.deleteOne(db, id: (items?[at].id)!)
                items?.remove(at: at)
            }
        } catch {
            print("Database \(error)")
        }
    }
    
    func getItemsFromDp(){
        do{
            try dbQueue.read{db in
                let results = try Items.fetchAll(db)
                self.items = results
            }
        }catch{
            print("Database \(error)")
        }
        bindItemsToController()
    }
}
