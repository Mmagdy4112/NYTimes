//
//  DetailsViewController.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/27/21.
//

import UIKit

class DetailsViewController: UIViewController,Storyboarded {
    var detailsViewModel : DetailsViewModel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(tap)
        DispatchQueue.main.async {
            let item = self.detailsViewModel.item
            self.titleLabel.text = item?.title
            self.detailsLabel.text = item?.abstract
            if let url = item?.multimedia?[0].url {
                self.img.sd_setImage(with: URL(string: url))
            }
        }
    }
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        if let url = self.detailsViewModel.item?.short_url{
            UIApplication.shared.open(URL(string: url)!)

        }
    }
}
