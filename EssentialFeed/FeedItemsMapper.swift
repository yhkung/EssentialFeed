//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/6/4.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let location: String?
    internal let description: String?
    internal let image: URL
}


internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    internal static var OK_200: Int { return 200 }
    
    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
    }
}
