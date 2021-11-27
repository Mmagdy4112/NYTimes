//
//  StoryCollectionCell.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/27/21.
//

import UIKit

class StoryCollectionCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookImg: UIImageView!
    var bookMarkHandler: (() -> Void)!

    @IBAction func bookMarkAction(_ sender: Any) {
        bookMarkHandler()
    }
}

