//
//  BreakingNewsHeaderTableViewCell.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/7/24.
//

import UIKit

protocol HeaderTableViewCellDelegate{
    func viewAllClicked(newsType:TypeOfNews)
}

class BreakingNewsHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    var typeOfNews:TypeOfNews?
    var delegate:HeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func viewAllCliked(_ sender: UIButton) {
        if let typeOfNews = self.typeOfNews{
            delegate?.viewAllClicked(newsType: typeOfNews)
        }
    }
}
