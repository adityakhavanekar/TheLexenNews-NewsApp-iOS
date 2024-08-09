//
//  NewsDetailViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/9/24.
//

import UIKit
import SDWebImage

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var authorLalbel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var newsContentView: UIView!
    @IBOutlet weak var newsBannerImageView: UIImageView!
    
    private var authorLabelText = ""
    private var categoryLabelText = ""
    private var newsTitleLabelText = ""
    private var bannerUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        UIHelperFunctions().addGradientToImageView(newsBannerImageView, colors: [UIColor.clear.cgColor,UIColor.black.cgColor], locations: [0.0,0.85, 1.0])
        newsContentView.layer.cornerRadius = 40
        categoryView.layer.cornerRadius = 12.5
        categoryView.clipsToBounds = true
        
        authorLalbel.text = authorLabelText
        newsTitleLabel.text = newsTitleLabelText
        categoryLabel.text = categoryLabelText
        newsBannerImageView.sd_setImage(with: URL(string:bannerUrl))
    }
    
    func setupUIData(newsType:TypeOfNews,everything:EverythingArticle?=nil,top10Headlines:TopHeadlinesArticles?=nil){
        switch newsType{
        case .everything:
            authorLabelText = everything?.author ?? ""
            newsTitleLabelText = everything?.title ?? ""
            categoryLabelText = everything?.source?.name ?? ""
            bannerUrl = everything?.urlToImage ?? ""
        case .topHeadlines:
            print("")
            authorLabelText = top10Headlines?.author ?? ""
            newsTitleLabelText = top10Headlines?.title ?? ""
            categoryLabelText = top10Headlines?.source?.name?.rawValue ?? ""
            bannerUrl = top10Headlines?.urlToImage ?? ""
        }
    }
}
