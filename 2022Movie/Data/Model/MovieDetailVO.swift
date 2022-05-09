//
//  MovieDetailVO.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
struct MovieDetailVO: Codable {
    var genres: [GenreVO]?
    var id: Int?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var productionCompanies: [ProductionCompaniesVO]?
    var voteAverage: Float?
}
//    "adult": false,
//    "backdrop_path": "/3G1Q5xF40HkUBJXxt2DQgQzKTp5.jpg",
//    "belongs_to_collection": null,
//    "budget": 50000000,
//    "genres": [
//
//        {
//            "id": 14,
//            "name": "Fantasy"
//        }
//    ],
//    "homepage": "https://movies.disney.com/encanto",
//    "id": 568124,
//    "imdb_id": "tt2953050",
//    "original_language": "en",
//    "original_title": "Encanto",
//    "overview": "The tale of an extraordinary family, the Madrigals, who live hidden in the mountains of //    "popularity": 4423.181,
//    "poster_path": "/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg",
//    "production_companies": [
//        {
//            "id": 6125,
//            "logo_path": "/tVPmo07IHhBs4HuilrcV0yujsZ9.png",
//            "name": "Walt Disney Animation Studios",
//            "origin_country": "US"
//        },
//        {
//            "id": 2,
//            "logo_path": "/wdrCwmRnLFJhEoH8GSfymY85KHT.png",
//            "name": "Walt Disney Pictures",
//            "origin_country": "US"
//        }
//    ],
//    "production_countries": [
//        {
//            "iso_3166_1": "US",
//            "name": "United States of America"
//        }
//    ],
//    "release_date": "2021-11-24",
//    "revenue": 228000000,
//    "runtime": 102,
//    "spoken_languages": [
//        {
//            "english_name": "Spanish",
//            "iso_639_1": "es",
//            "name": "Español"
//        },
//        {
//            "english_name": "English",
//            "iso_639_1": "en",
//            "name": "English"
//        }
//    ],
//    "status": "Released",
//    "tagline": "There's a little magic in all of us ...almost all of us.",
//    "title": "Encanto",
//    "video": false,
//    "vote_average": 7.8,
//    "vote_count": 4039
//}
