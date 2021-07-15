//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by YH Kung on 2021/7/15.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest

final class FeedViewController {
    convenience init(loader: FeedViewControllerTests.LoaderSpy) {
        self.init()
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_initDoesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    // MARK: - Helpers
    
    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
    }
}
