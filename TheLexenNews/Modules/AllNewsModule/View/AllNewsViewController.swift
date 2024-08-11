//
//  AllNewsViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/10/24.
//

import UIKit

class AllNewsViewController: UIViewController {

    @IBOutlet weak var newsContentTableView: UITableView!
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    var typeOfNews:TypeOfNews
    var viewModel:AllNewsViewModel = AllNewsViewModel()
    
    init(typeOfNews: TypeOfNews) {
        self.typeOfNews = typeOfNews
        super.init(nibName: "AllNewsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryCollectionView()
        setupNewsContentTableVIew()
        CallAPI()
    }
    
    private func setupCountryCollectionView(){
        countryCollectionView.register(UINib(nibName: AllNewsConstants.CountryCollectionVIewCell, bundle: nil), forCellWithReuseIdentifier: AllNewsConstants.CountryCollectionVIewCell)
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
    }
    
    private func setupNewsContentTableVIew(){
        newsContentTableView.register(UINib(nibName: HomeConstants.RecomendationsTableViewCell, bundle: nil), forCellReuseIdentifier: HomeConstants.RecomendationsTableViewCell)
        newsContentTableView.dataSource = self
        newsContentTableView.delegate = self
    }
    
    private func CallAPI(){
        switch self.typeOfNews {
        case .everything:
            viewModel.getEverything { bool in
                switch bool{
                case true:
                    DispatchQueue.main.async{
                        self.newsContentTableView.reloadData()
                    }
                case false:
                    print("Error getting the data")
                }
            }
        case .topHeadlines:
            viewModel.getTopHeadlines { bool in
                switch bool{
                case true:
                    DispatchQueue.main.async{
                        self.newsContentTableView.reloadData()
                    }
                case false:
                    print("Error getting the data")
                }
                
            }
        }
    }
    
    @IBAction func dismissBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AllNewsViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = countryCollectionView.dequeueReusableCell(withReuseIdentifier: AllNewsConstants.CountryCollectionVIewCell, for: indexPath) as? CountryCollectionVIewCell else {return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = countryCollectionView.frame.width
        let height = countryCollectionView.frame.height
        return CGSize(width: width/4, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension AllNewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch typeOfNews{
        case .everything:
            viewModel.getEverythingArray()?.count ?? 0
        case .topHeadlines:
            viewModel.getTopNews()?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsContentTableView.dequeueReusableCell(withIdentifier: HomeConstants.RecomendationsTableViewCell, for: indexPath) as? RecomendationsTableViewCell else { return UITableViewCell() }
        
        switch self.typeOfNews{
        case .everything:
            if let article = viewModel.getEverythingArray()?[indexPath.row]{
                cell.setupData(typeOfNews: .everything, everythingData: article, topHeadlinesData: nil)
            }
        case .topHeadlines:
            if let article = viewModel.getTopNews()?[indexPath.row]{
                cell.setupData(typeOfNews: .topHeadlines, everythingData: nil, topHeadlinesData: article)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
