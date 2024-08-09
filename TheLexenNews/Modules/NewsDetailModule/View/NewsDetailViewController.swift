//
//  NewsDetailViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/9/24.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var authorLalbel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var newsContentView: UIView!
    @IBOutlet weak var newsBannerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        UIHelperFunctions().addGradientToImageView(newsBannerImageView, colors: [UIColor.clear.cgColor,UIColor.black.cgColor], locations: [0.0,0.85, 1.0])
        newsContentView.layer.cornerRadius = 40
        categoryView.layer.cornerRadius = 12.5
        categoryView.clipsToBounds = true
    }
}
