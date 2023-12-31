//
//  Software.swift
//  AppStoreMimic
//
//  Created by hyonsoo on 2023/09/17.
//

import Foundation

struct Software: Identifiable {
    let id: String
    let icon: URL?
    let bigIcon: URL?
    let title: String
    let subtitle: String
    let description: String
    let screenshots: [URL]
    let rating: Double
    let ratingCount: Int
    let contentAdvisoryRating: String
    let genre: String
    let sellerName: String
    let version: String
    let releaseNote: String?
}
