//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/6/27.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

public class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
}

private class ManagedCache: NSManagedObject {
     @NSManaged var timestamp: Date
     @NSManaged var feed: NSOrderedSet
 }

 private class ManagedFeedImage: NSManagedObject {
     @NSManaged var id: UUID
     @NSManaged var imageDescription: String?
     @NSManaged var location: String?
     @NSManaged var url: URL
     @NSManaged var cache: ManagedCache
 }
