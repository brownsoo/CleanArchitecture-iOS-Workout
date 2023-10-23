//
//  ApiRequest.swift
//  AppStoreSample
//
//  Created by hyonsoo han on 2023/09/17.
//

import Foundation

struct ApiRequest<A>: NetworkRequest {
    typealias ResponseType = A
    let endpoint: NetworkEndpoint
    let method: HttpMethod
    let body: Data?
    
    var headers: [String: String] {
        endpoint.headers
    }
    
    var url: URL {
        URL(string: endpoint.urlString + paramsAppendix())!
    }
    
    init(_ endpoint: NetworkEndpoint,
         method: HttpMethod = .get,
         body: Data? =  nil
    ) {
        self.endpoint = endpoint
        self.method = method
        self.body = body
    }
    
    private func paramsAppendix() -> String {
        guard let params = endpoint.parameters else {
            return ""
        }
        return "?\(params.map { "\($0.key)=\($0.value)" }.joined(separator: "&"))"
    }
    
    func toUrlRequest() throws -> URLRequest {
        var request = URLRequest(url: self.url)
        if let body = self.body {
            request.httpBody = body
        }
        request.httpMethod = self.method.rawValue
        request.allHTTPHeaderFields = self.headers
        return request
    }
}