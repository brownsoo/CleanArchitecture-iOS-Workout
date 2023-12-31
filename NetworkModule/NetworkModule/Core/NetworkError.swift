//
//  NetworkError.swift
//  NetworkModule
//
//  Created by hyonsoo on 10/23/23.
//

import Foundation

public enum NetworkError: Error {
    case unauthorized
    case requestFailed(statusCode: Int, message: String?)
    case parsing(cause: Error, model: String)
    case emptyResponse
    case networkDisconnected
    case networkError(cause: Error)
    case contentNotChanged
    case urlGenerate(urlString: String)
}


public extension Error {
    var asNetworkError: NetworkError? {
        self as? NetworkError
    }
}

extension NetworkError : HumanReadable {
    public func humanMessage() -> String {
        switch self {
            case .unauthorized:
                return "미인증 요청이네요."
            case .requestFailed(let statusCode, let message):
                return "\(message ?? "요청 실패") [\(statusCode)]"
            case .parsing(let cause, let model):
                return "\(model)파싱 오류\n\(cause)"
            case .emptyResponse:
                return "응답 값이 없어요."
            case .networkDisconnected:
                return "인터넷 연결이 필요합니다."
            case .networkError(let cause):
                return "\(cause)"
            case .contentNotChanged:
                return "컨텐츠 변경이 없음."
            case .urlGenerate(let urlString):
                return "주소 형식이 맞지 않아요.\n\(urlString)"
        }
    }
}
