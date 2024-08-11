//
//  RecomendationsTableViewCell.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import UIKit
import SDWebImage

class RecomendationsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var newsBannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(){
        newsBannerImageView.clipsToBounds = true
        newsBannerImageView.layer.cornerRadius = 15
        self.selectionStyle = .none
    }
    
    func setupData(typeOfNews:TypeOfNews,everythingData:EverythingArticle?,topHeadlinesData:TopHeadlinesArticles?){
        switch typeOfNews{
        case .everything:
            newsAuthorLabel.text = everythingData?.author
            newsTitleLabel.text = everythingData?.title
            sourceNameLabel.text = everythingData?.source?.name
            newsBannerImageView.sd_setImage(with: URL(string: everythingData?.urlToImage ?? ""))
        case .topHeadlines:
            newsAuthorLabel.text = topHeadlinesData?.author
            newsTitleLabel.text = topHeadlinesData?.title
            sourceNameLabel.text = topHeadlinesData?.source?.name?.rawValue
            newsBannerImageView.sd_setImage(with: URL(string: topHeadlinesData?.urlToImage ?? ""))
        }
    }
}
