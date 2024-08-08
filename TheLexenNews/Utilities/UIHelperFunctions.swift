//
//  UIHelperFunctions.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import Foundation
import UIKit

class UIHelperFunctions{
    func addGradientToImageView(_ imageView: UIImageView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 0.85, 1.0]
        imageView.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        imageView.layer.addSublayer(gradientLayer)
    }
}
