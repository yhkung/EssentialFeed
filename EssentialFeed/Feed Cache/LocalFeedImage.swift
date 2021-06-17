//
//  LocalFeedItem.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/6/16.
//

import Foundation

public struct LocalFeedImage: Equatable {
    public let id: UUID
    public let location: String?
    public let description: String?
    public let url: URL
    
    public init(id: UUID, location: String?, description: String?, url: URL) {
        self.id = id
        self.location = location
        self.description = description
        self.url = url
    }
}
