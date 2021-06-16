//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/5/31.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    private let url: URL
    private let client: HTTPClient
 
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .success(data, response):
                completion(RemoteFeedLoader.map(data, response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, _ response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemsMapper.map(data, response)
            return .success(items.toModels())
        } catch {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
    }
}

extension Array where Element == RemoteFeedItem {
    func toModels() -> [FeedItem] {
        return map { FeedItem(id: $0.id, location: $0.location, description: $0.description, imageURL: $0.image) }
    }
}
