//
//  UIImage+Extension.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 9.10.2022.
//

import Foundation
import UIKit

let cache = NSCache<AnyObject,UIImage>()

extension UIImageView {
    
    func downloadImage(from url: URL?) {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let url = url else { return }
        
        if let image = cache.object(forKey: url.absoluteString as NSString ) {
            self.image = image
            return
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { data, response, err in
          
            if let err = err {
                fatalError(err.localizedDescription)
                return
            }
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = image
                //cache.setObject(image, forKey: url.absoluteString as NSString)
            }
            
            

        }
        dataTask.resume()
    }
}
