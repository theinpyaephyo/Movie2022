//
//  NowplayingVO.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class NowplayingVO: Object, Codable {
    @Persisted var totalPages: Int?
    @Persisted(primaryKey: true) var page: Int?
    @Persisted var results: List<MoviesVO>
}
class MoviesVO: Object, Codable {
//    @Persisted var adult: BooleanLiteralType
//    @Persisted var backdropPath: String?
//    @Persisted var genreIds: List<Int?>
    @Persisted(primaryKey: true) var id: Int?
//    @Persisted var originalLanguage: String?
//    @Persisted var originalTitle: String?
//    @Persisted var overview: String?
//    @Persisted var popularity: Float?
    @Persisted var posterPath: String?
//    @Persisted var releaseDate: String?
//    @Persisted var title: String?
//    @Persisted var video: BooleanLiteralType?
//    @Persisted var voteAverage: Float?
//    @Persisted var voteCount: Int?
}
//
//    "total_pages": 74,
//
//results": [
//{
//    "adult": false,
//    "backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
//    "genre_ids": [
//        28,
//        12,
//        878
//    ],
//    "id": 634649,
//    "original_language": "en",
//    "original_title": "Spider-Man: No Way Home",
//    "overview": "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
//    "popularity": 14463.144,
//    "poster_path": "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
//    "release_date": "2021-12-15",
//    "title": "Spider-Man: No Way Home",
//    "video": false,
//    "vote_average": 8.4,
//    "vote_count": 7282
//},
