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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section{
        case 0:
            let view = Bundle.main.loadNibNamed(HomeConstants.BreakingNewsHeaderTableViewCell, owner: self)?.first as? BreakingNewsHeaderTableViewCell
            return view
        case 1:
            let view = Bundle.main.loadNibNamed(HomeConstants.BreakingNewsHeaderTableViewCell, owner: self)?.first as? BreakingNewsHeaderTableViewCell
            view?.headerLabel.text = HomeConstants.recomendations
            return view
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.BreakingNewsTableViewCell, for: indexPath) as? BreakingNewsTableViewCell else{ return UITableViewCell() }
            return cell
        case 1:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.RecomendationsTableViewCell, for: indexPath) as? RecomendationsTableViewCell else{ return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 220
        default:
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
