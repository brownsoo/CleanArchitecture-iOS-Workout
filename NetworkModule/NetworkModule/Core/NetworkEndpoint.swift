//
//  NetworkEndpoint.swift
//  NetworkModule
//
//  Created by hyonsoo han on 2023/09/17.
//

import Foundation

public protocol NetworkEndpoint {
    var urlString: String { get }
    var headers: [String: String] { get }
    var parameters: [String: Any]? { get }
}
