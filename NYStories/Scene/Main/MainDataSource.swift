//
//  MainDataSource.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/26/21.
//

import UIKit
class MainDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDelegate,UITableViewDataSource{
    private var cellIdentifier : String!
    var items : [T]?
    var configureCell : (CELL, T?) -> () = {_,_ in }
    var didSelectItem: ((Int) -> Void)?

    
    init(cellIdentifier : String, items : [T]?, configureCell : @escaping (CELL, T?) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items?[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem!(indexPath.row)
    }
    
}
