//
//  CodableFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by YH Kung on 2021/6/20.
//

import XCTest
import EssentialFeed

class CodableFeedStore {
    
    func retrieve(completion: @escaping FeedStore.RetrievalCompletion) {
        completion(.empty)
    }
    
}

class CodableFeedStoreTests: XCTestCase {

    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = CodableFeedStore()
        let exp = expectation(description: "Wait for retrieval completed")
        
        sut.retrieve() { result in
            switch result {
            case .empty:
                break
            default:
                XCTFail("Expected empty result, get \(result) instead.")
            }
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
    }
    
    func test_retrieve_hasNoSideEffectOnEmptyCache() {
        let sut = CodableFeedStore()
        let exp = expectation(description: "Wait for retrieval completed")
        
        sut.retrieve() { firstResult in
            sut.retrieve() { secondResult in
                switch (firstResult, secondResult) {
                case (.empty, .empty):
                    break
                default:
                    XCTFail("Expected retrieving twice from empty cache to deliver same empty result, got \(firstResult) and \(secondResult) instead")
                }
            }
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
    }

}
