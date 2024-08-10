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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryCollectionView()
        setupNewsContentTableVIew()
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsContentTableView.dequeueReusableCell(withIdentifier: HomeConstants.RecomendationsTableViewCell, for: indexPath) as? RecomendationsTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
