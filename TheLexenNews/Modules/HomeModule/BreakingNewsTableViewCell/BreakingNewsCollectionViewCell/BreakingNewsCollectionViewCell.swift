//
//  BreakingNewsCollectionViewCell.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/7/24.
//

import UIKit

class BreakingNewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsBannerImageView: UIImageView!
    @IBOutlet weak var newsAuthorNameLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        self.layer.cornerRadius = 20
        categoryLabel.clipsToBounds = true
        categoryLabel.layer.cornerRadius = 10
        UIHelperFunctions().addGradientToImageView(newsBannerImageView)
    }

}
extension BreakingNewsCollectionViewCell{
    
}
