//
//  FeedStore.swift
//  EssentialFeedTests
//
//  Created by YH Kung on 2021/6/15.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], currentDate: Date, completion: @escaping InsertionCompletion)
}
