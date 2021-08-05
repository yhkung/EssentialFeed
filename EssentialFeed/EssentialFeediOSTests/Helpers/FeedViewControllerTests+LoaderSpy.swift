//
//  FeedViewControllerTests+LoaderSpy.swift
//  EssentialFeediOSTests
//
//  Created by YH Kung on 2021/8/5.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import EssentialFeed
import EssentialFeediOS

class LoaderSpy: FeedLoader, FeedImageDataLoader {
    // MARK: - FeedLoader

    private(set) var feedRequests = [(FeedLoader.Result) -> Void]()
    var loadFeedCallCount: Int {
        return feedRequests.count
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        feedRequests.append(completion)
    }

    func completeFeedLoading(with feed: [FeedImage] = [], at index: Int = 0) {
        feedRequests[index](.success(feed))
    }

    func completeFeedLoadingError(at index: Int = 0) {
        let error = NSError(domain: "an error", code: 0)
        feedRequests[index](.failure(error))
    }

    // MARK: - FeedImageDataLoader
    private var imageRequests = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()
    var loadedImageURLs: [URL] {
        imageRequests.map { $0.url }
    }
    private(set) var cancelledImageURLs = [URL]()

    private struct TasksSpy: FeedImageDataLoaderTask {
        let cancelCallback: () -> Void
        func cancel() {
            cancelCallback()
        }
    }

    func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        imageRequests.append((url, completion))
        return TasksSpy { [weak self] in self?.cancelledImageURLs.append(url) }
    }

    func completeImageLoading(with imageData: Data = Data(), at index: Int = 0) {
        imageRequests[index].completion(.success(imageData))
    }

    func completeImageLoadingWithError(at index: Int = 0) {
        let error = NSError(domain: "an error", code: 0)
        imageRequests[index].completion(.failure(error))
    }
}
