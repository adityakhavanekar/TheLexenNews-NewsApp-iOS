//
//  HomeViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/7/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationOnHome()
        setupUI()
    }
    
    func setupNavigationOnHome(){
        self.navigationController?.navigationBar.isHidden = true
        if let viewControllers = self.navigationController?.viewControllers{
            var views = viewControllers
            views.removeFirst()
            self.navigationController?.setViewControllers(views, animated: false)
        }
    }
    
    func setupUI(){
        setupCells()
    }
    
    func setupCells(){
        homeTableView.register(UINib(nibName: HomeConstants.BreakingNewsHeaderTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.BreakingNewsHeaderTableViewCell)
        homeTableView.separatorColor = .clear
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.BreakingNewsHeaderTableViewCell, for: indexPath) as? BreakingNewsHeaderTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
