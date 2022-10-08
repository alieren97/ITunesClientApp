//
//  ViewController.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 7.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iTunesAPI.shared.fetchPodcasts { response, err in
            if let err = err {
                print(err)
                return
            }
            guard let response = response else { return }
            print(response)
        }
    }

}

