//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/5/31.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
 
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error, response in
            if let response = response {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
        }
    }
}

