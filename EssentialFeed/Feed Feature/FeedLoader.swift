//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/5/30.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    associatedtype Error: Swift.Error
    
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
