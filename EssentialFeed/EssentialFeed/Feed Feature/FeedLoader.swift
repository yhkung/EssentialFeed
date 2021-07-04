//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation

public typealias LoadFeedResult = Swift.Result<[FeedImage], Error>

public protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
