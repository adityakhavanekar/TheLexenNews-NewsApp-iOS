//
//  BreakingNewsTableViewCell.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/7/24.
//

import UIKit

protocol BreakingNewsSelectedDelegate{
    func selectedNews(news:TopHeadlinesArticles)
}

class BreakingNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var breakingNewsCollectionView: UICollectionView!
    var delegate: BreakingNewsSelectedDelegate?
    var viewModel:HomeViewModel? {
        didSet{
            breakingNewsCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCollectionView(){
        breakingNewsCollectionView.register(UINib(nibName: HomeConstants.BreakingNewsCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: HomeConstants.BreakingNewsCollectionViewCell)
        breakingNewsCollectionView.layer.cornerRadius = 10
        breakingNewsCollectionView.dataSource = self
        breakingNewsCollectionView.delegate = self
        
    }
    
    func setupViewModel(viewModel:HomeViewModel){
        self.viewModel = viewModel
    }
    
}

extension BreakingNewsTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getTop5Headlines()?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = breakingNewsCollectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.BreakingNewsCollectionViewCell, for: indexPath) as?  BreakingNewsCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        if let data = viewModel?.getTop5Headlines()?[indexPath.row]{
            cell.setupData(data: data)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let article = self.viewModel?.getTop5Headlines()?[indexPath.row]{
            delegate?.selectedNews(news: article)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.breakingNewsCollectionView.frame.width, height: self.breakingNewsCollectionView.frame.height)
    }
}
