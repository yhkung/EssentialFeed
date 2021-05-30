//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/5/30.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
