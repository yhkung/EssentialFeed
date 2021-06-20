//
//  FeedCacheTestsHelper.swift
//  EssentialFeedTests
//
//  Created by YH Kung on 2021/6/20.
//

import Foundation
import EssentialFeed

func uniqueImage() -> FeedImage {
    return FeedImage(id: UUID(), location: "any", description: "any", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, location: $0.location, description: $0.description, url: $0.url) }
    return (models, local)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
