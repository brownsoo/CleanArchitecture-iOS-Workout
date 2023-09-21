//
//  NetworkClient.swift
//  AppStoreSample
//
//  Created by hyonsoo han on 2023/09/17.
//

import Foundation
import Alamofire

protocol NetworkClient {
    func request(_ resource: Resource) async throws -> Response
}

class DefaultNetworkClient: NetworkClient {
    
    let session: Alamofire.Session = {
        let config = URLSessionConfiguration.af.default
        if kLoggingNetwork {
            let apiLogger = AlarmoLogger()
            return Session(configuration: config, eventMonitors: [apiLogger])
        }
        return Session(configuration: config)
    }()
    
    func request(_ resource: Resource) async throws -> Response {
        let request = try resource.toUrlRequest()
        let task = self.session.request(request)
            .validate(statusCode: 200..<299)
            .serializingData()
        let response = await task.response
        
        switch response.result {
            case .success(let data):
                return NetworkResponse(status: response.response?.statusCode ?? 0, data: data)
            case .failure(let afError):
                throw self.convertToAppError(afError, withData: response.data)
        }
    }
    
    private func convertToAppError(_ error: AFError, withData data: Data?) -> AppError {
        if error.responseCode == 304 {
            return AppError.contentNotChanged
        }
        if let nsError = error.underlyingError as? NSError {
            switch(nsError.code) {
                case NSURLErrorTimedOut,
                    NSURLErrorNotConnectedToInternet,
                    NSURLErrorInternationalRoamingOff,
                    NSURLErrorDataNotAllowed,
                    NSURLErrorCannotFindHost,
                    NSURLErrorCannotConnectToHost,
                NSURLErrorNetworkConnectionLost:
                    return .networkDisconnected
                default:
                    break
                    
            }
        }
        return .networkError(cause: error)
    }
}
