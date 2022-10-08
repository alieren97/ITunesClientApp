//
//  PoscastResponse.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 8.10.2022.
//

import Foundation

struct PodcastResponse: Decodable {
    let resutlCount: Int?
    let results: [Podcast]?
}
