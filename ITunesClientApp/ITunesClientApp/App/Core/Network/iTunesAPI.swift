//
//  ITunesAPI.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 7.10.2022.
//

import Foundation
import UIKit

final class iTunesAPI {
    static let shared = iTunesAPI()
    private var baseURL: URLComponents = URLComponents(string: "https://itunes.apple.com/search")!
    
    
    func fetchPodcasts(completion: @escaping (PodcastResponse?,Error?)-> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let queryItems = [URLQueryItem(name: "term", value: "podcast")]
        baseURL.queryItems = queryItems
        let request = URLRequest(url: baseURL.url!)
        let dataTask = session.dataTask(with: request) { data, response, err in
            if let err = err {
                completion(nil,err)
                return
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            let podcastResponse = try? decoder.decode(PodcastResponse.self, from: data)
            
            completion(podcastResponse,nil)
        }
        dataTask.resume()
    }
  

}
