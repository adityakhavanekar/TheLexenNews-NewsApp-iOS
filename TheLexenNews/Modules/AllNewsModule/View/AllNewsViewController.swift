//
//  AllNewsViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/10/24.
//

import UIKit

class AllNewsViewController: UIViewController {

    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryCollectionView()
    }
    
    private func setupCountryCollectionView(){
        countryCollectionView.register(UINib(nibName: AllNewsConstants.CountryCollectionVIewCell, bundle: nil), forCellWithReuseIdentifier: AllNewsConstants.CountryCollectionVIewCell)
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
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
        return 5
    }
}
