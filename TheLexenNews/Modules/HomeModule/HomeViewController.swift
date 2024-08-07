//
//  HomeViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/7/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationOnHome()
    }
    
    func setupNavigationOnHome(){
        self.navigationController?.navigationBar.isHidden = true
        if let viewControllers = self.navigationController?.viewControllers{
            var views = viewControllers
            views.removeFirst()
            self.navigationController?.setViewControllers(views, animated: false)
        }
        
    }
}
