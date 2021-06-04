//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by YH Kung on 2021/6/4.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
