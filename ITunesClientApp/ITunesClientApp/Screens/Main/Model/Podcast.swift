//
//  Podcast.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 8.10.2022.
//

import Foundation

struct Podcast: Decodable {
    let artistName: String?
    let trackName: String?
    let artworkLarge: URL?
    
    enum CodinKeys: String, CodingKey {
        case artistName
        case trackName
        case artworkLarge = "artworkUrl600"
    }
}
