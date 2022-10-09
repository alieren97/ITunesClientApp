//
//  MainView.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 8.10.2022.
//

import UIKit

final class MainView: UIView {
    
    private let cellDimension: CGFloat = .screenWidth / 2 - 8.0
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellDimension, height: cellDimension)
        //Hesaplama süresini kısaltıyor
        
        return flowLayout
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        collectionView.register(PodcastCollectionViewCell.self, forCellWithReuseIdentifier: PodcastCollectionViewCell.identifier)
        setupCollectionViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCollectionViewLayout() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setCollectionViewDelegate(_ delegate: UICollectionViewDelegate, andDataSource dataSource:UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func refresh() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
