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
        logoImageView.layer.cornerRadius = 10
    }
    
    func setupCells(){
        homeTableView.register(UINib(nibName: HomeConstants.BreakingNewsHeaderTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.BreakingNewsHeaderTableViewCell)
        homeTableView.register(UINib(nibName: HomeConstants.BreakingNewsTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.BreakingNewsTableViewCell)
        homeTableView.register(UINib(nibName: HomeConstants.RecomendationsTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.RecomendationsTableViewCell)
        homeTableView.separatorColor = .clear
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.BreakingNewsHeaderTableViewCell, for: indexPath) as? BreakingNewsHeaderTableViewCell else{
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.BreakingNewsTableViewCell, for: indexPath) as? BreakingNewsTableViewCell else{
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.BreakingNewsHeaderTableViewCell, for: indexPath) as? BreakingNewsHeaderTableViewCell else{
                return UITableViewCell()
            }
            cell.headerLabel.text = HomeConstants.recomendations
            return cell
        default:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.RecomendationsTableViewCell, for: indexPath) as? RecomendationsTableViewCell else{ return UITableViewCell() }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 50
        case 1:
            return 200
        case 2:
            return 50
        default:
            return 120
        }
    }
    
}
