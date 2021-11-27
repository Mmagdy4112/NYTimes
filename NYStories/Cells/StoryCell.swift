//
//  MenuCell.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/26/21.
//

import UIKit

class StoryCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookImg: UIImageView!
    var bookMarkHandler: (() -> Void)!

    @IBAction func bookMarkAction(_ sender: Any) {
        bookMarkHandler()
    }
}
