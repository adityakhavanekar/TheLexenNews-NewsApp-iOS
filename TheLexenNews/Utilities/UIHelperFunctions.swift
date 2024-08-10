//
//  UIHelperFunctions.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import Foundation
import UIKit

class UIHelperFunctions{
    func addGradientToImageView(_ imageView: UIImageView,colors:[CGColor], locations:[NSNumber]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        imageView.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        imageView.layer.addSublayer(gradientLayer)
    }
    
    func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = .gray
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(activityIndicator)
            
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = true
            
            return activityIndicator
        }
    
    func hideActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
}
