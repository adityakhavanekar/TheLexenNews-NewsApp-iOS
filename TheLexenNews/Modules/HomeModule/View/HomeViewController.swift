//
//  HomeViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/7/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    private var viewModel = HomeViewModel()
    private var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationOnHome()
        setupUI()
        callAPI()
    }
    
    private func setupNavigationOnHome(){
        self.navigationController?.navigationBar.isHidden = true
        if let viewControllers = self.navigationController?.viewControllers{
            var views = viewControllers
            views.removeFirst()
            self.navigationController?.setViewControllers(views, animated: false)
        }
    }
    
    private func setupUI(){
        loadingView.isHidden = false
        setupTableView()
        logoImageView.layer.cornerRadius = 10
    }
    
    private func setupTableView(){
        homeTableView.register(UINib(nibName: HomeConstants.BreakingNewsHeaderTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.BreakingNewsHeaderTableViewCell)
        homeTableView.register(UINib(nibName: HomeConstants.BreakingNewsTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.BreakingNewsTableViewCell)
        homeTableView.register(UINib(nibName: HomeConstants.RecomendationsTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.RecomendationsTableViewCell)
        homeTableView.separatorColor = .clear
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    private func callAPI(){
        activityIndicator = UIHelperFunctions().showActivityIndicator(in: view)
        viewModel.getEverything { bool in
            switch bool{
            case true:
                DispatchQueue.main.async{
                    self.homeTableView.reloadData()
                    UIHelperFunctions().hideActivityIndicator(self.activityIndicator)
                    self.loadingView.isHidden = true
                }
            case false:
                print(NetworkErrors.decodingError)
                UIHelperFunctions().hideActivityIndicator(self.activityIndicator)
            }
        }
        viewModel.getTopHeadlines { bool in
            switch bool{
            case true:
                DispatchQueue.main.async{
                    self.homeTableView.reloadData()
                    UIHelperFunctions().hideActivityIndicator(self.activityIndicator)
                    self.loadingView.isHidden = true
                }
            case false:
                print(NetworkErrors.decodingError)
                UIHelperFunctions().hideActivityIndicator(self.activityIndicator)
            }
        }
    }
}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return viewModel.getTop5EverythingNews()?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.BreakingNewsTableViewCell, for: indexPath) as? BreakingNewsTableViewCell else{ return UITableViewCell() }
            cell.delegate = self
            cell.setupViewModel(viewModel: self.viewModel)
            return cell
        case 1:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeConstants.RecomendationsTableViewCell, for: indexPath) as? RecomendationsTableViewCell else{ return UITableViewCell() }
            if let data = viewModel.getTop5EverythingNews()?[indexPath.row]{
                cell.setupData(data: data)
            }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            print("")
        case 1:
            let detailVC = NewsDetailViewController()
            detailVC.setupUIData(newsType: .everything,everything: viewModel.getTop5EverythingNews()?[indexPath.row])
            self.navigationController?.pushViewController(detailVC, animated: true)
        default:
            print("")
        }
        
    }
    
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

extension HomeViewController:BreakingNewsSelectedDelegate{
    func selectedNews(news: TopHeadlinesArticles) {
        let detailVC = NewsDetailViewController()
        detailVC.setupUIData(newsType: .topHeadlines,top10Headlines: news)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
