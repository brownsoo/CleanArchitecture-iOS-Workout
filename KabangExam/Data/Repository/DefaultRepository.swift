//
//  DefaultRepository.swift
//  KabangExam
//
//  Created by hyonsoo on 2023/09/17.
//

import Foundation
import Combine

final class DefaultRepository {
    private let dataService: NetworkDataService
    private let recentsCache: RecentsStorage
    
    init(dataService: NetworkDataService, recentsCache: RecentsStorage) {
        self.dataService = dataService
        self.recentsCache = recentsCache
    }
}

extension DefaultRepository: iTunesRepository {
    func searchRecents(_ term: String, onResult: @escaping ([String]) -> Void) -> Cancellable {
        return Task { [weak self] in
            guard let this = self else {
                return
            }
            let result = await this.recentsCache.findRecents(searchTerm: term)
            onResult(result)
        }
    }
    
    func searchSoftware(_ term: String, onResult: @escaping (Result<[Software], Error>) -> Void) -> Cancellable {
        return Task { [weak self] in
            guard let this = self else {
                return
            }
            do {
                let result = try await this.dataService.request(SearchApi.search(term))
                guard !Task.isCancelled else { return }
                await this.recentsCache.saveRecent(searchTerm: term)
                onResult(.success(result.toDomain()))
            } catch {
                onResult(.failure(error))
            }
        }
    }
    
}
