//
//  DefaultDetailViewModel.swift
//  KabangExam
//
//  Created by hyonsoo on 2023/09/20.
//

import Foundation
import Combine

final class DefaultDetailViewModel: BaseViewModel, DetailViewModel {
    
    // DetailViewModel ->
    var iconUrl: URL?
    var title: String
    var userRating: Double
    var userRatingCount: String
    var genre: String
    var contentAdvisoryRating: String
    var screenshots: [URL]
    var description: String
    var releaseNote: String?
    var isMoreOpened: AnyPublisher<Bool, Never> {
        _isMoreOpened.eraseToAnyPublisher()
    }
    // <--
    private let _isMoreOpened = CurrentValueSubject<Bool, Never>(false)
    
    init(_ data: Software) {
        iconUrl = data.icon
        title = data.title
        userRating = data.rating
        userRatingCount = data.ratingCount.readableCount()
        genre = data.genre
        contentAdvisoryRating = data.contentAdvisoryRating
        screenshots = data.screenshots
        description = data.description
        releaseNote = data.releaseNote
    }
    
    func moreDescription() {
        _isMoreOpened.send(true)
    }
}