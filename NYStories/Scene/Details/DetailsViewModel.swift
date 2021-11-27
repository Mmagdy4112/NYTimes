//
//  DetailsViewModel.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/27/21.
//

import Foundation
class DetailsViewModel:NSObject{
    var item : Items?

    var coordinator: MainCoordinator?
    var bindItemsToController : (() -> ()) = {}
    
    override init(){
        super.init()
    }
}
