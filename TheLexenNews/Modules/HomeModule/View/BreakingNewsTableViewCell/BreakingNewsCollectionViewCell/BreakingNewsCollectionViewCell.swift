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
    @IBOutlet weak var categoryLabelView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        self.layer.cornerRadius = 20
        categoryLabelView.clipsToBounds = true
        categoryLabelView.layer.cornerRadius = 10
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
            UIHelperFunctions().addGradientToImageView(self.newsBannerImageView)
        }
    }
    
    func setupData(data:TopHeadlinesArticles){
        newsAuthorNameLabel.text = data.author
        newsTitleLabel.text = data.title
        categoryLabel.text = data.source?.name?.rawValue
        newsBannerImageView.sd_setImage(with: URL(string: data.urlToImage ?? ""))
    }

}
extension BreakingNewsCollectionViewCell{
    
}
