//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/6/16.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let location: String?
    internal let description: String?
    internal let image: URL
}
