//
//  BaseViewModel.swift
//  AppStoreMimic
//
//  Created by hyonsoo on 2023/09/18.
//

import Foundation
import Combine

protocol ViewModel: AnyObject {
    // -- out
    var errorMessages: AnyPublisher<String, Never> { get }
    var alertMesssges: AnyPublisher<String, Never> { get }
    // -- in
    /// 초기화
    func load() -> Void
}

class BaseViewModel: ViewModel {
    private let _errorMessages = PassthroughSubject<String, Never>()
    nonisolated var errorMessages: AnyPublisher<String, Never> {
        _errorMessages.eraseToAnyPublisher()
    }
    
    private let _alertMesssges = PassthroughSubject<String, Never>()
    nonisolated var alertMesssges: AnyPublisher<String, Never> {
        _alertMesssges.eraseToAnyPublisher()
    }
    
    var cancellables: Set<AnyCancellable> = []
    
    deinit {
        cancellables.forEach { work in
            work.cancel()
        }
        cancellables.removeAll()
    }
    
    func load() {
    }
    
    func alertMessage(_ message: String) {
        _alertMesssges.send(message)
    }
    
    func handleError(_ error: Error) {
        let message: String
        debugPrint(error)
        if let e = error as? HumanReadable {
            message = e.humanMessage()
        } else {
            message = error.localizedDescription
        }
        _errorMessages.send(message)
    }
}
