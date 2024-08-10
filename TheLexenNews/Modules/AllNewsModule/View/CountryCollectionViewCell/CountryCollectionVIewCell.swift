//
//  CountryCollectionVIewCell.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/10/24.
//

import UIKit

class CountryCollectionVIewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
            self.mainView.layer.cornerRadius = self.frame.height/2
        }
    }

}
