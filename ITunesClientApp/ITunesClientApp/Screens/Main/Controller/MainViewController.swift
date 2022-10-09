//
//  ViewController.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 7.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    private var podcastResponse: PodcastResponse? {
        didSet{
            mainView.refresh()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchPodcasts()
    }
    
    
    private func fetchPodcasts() {
        iTunesAPI.shared.fetchPodcasts { response, err in
            if let err = err {
                fatalError(err.localizedDescription)
            }
            self.podcastResponse = response
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        podcastResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PodcastCollectionViewCell.identifier, for: indexPath) as! PodcastCollectionViewCell
        let podcast = podcastResponse?.results?[indexPath.row]
        cell.title = podcast?.trackName
        cell.imageView.downloadImage(from: podcast?.artworkUrl600)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}
