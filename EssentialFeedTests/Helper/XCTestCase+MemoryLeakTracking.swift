//
//  XCTestCase+MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by YH Kung on 2021/6/7.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks( _ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocate. Potential memory leak.", file: file, line: line)
        }
    }
}
