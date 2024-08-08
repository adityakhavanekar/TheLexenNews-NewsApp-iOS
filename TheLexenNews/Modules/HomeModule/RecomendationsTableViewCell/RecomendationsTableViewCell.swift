//
//  RecomendationsTableViewCell.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import UIKit

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
    }
}
