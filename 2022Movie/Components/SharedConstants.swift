//
//  SharedConstants.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
class SharedConstants {
    static let baseUrl = "https://api.themoviedb.org/3/"
    
    static let posterPath = "https://image.tmdb.org/t/p/original/"
    
    enum PARAM_KEY {
        static let PAGE = "page"
        static let API_KEY = "api_key"
        static let LANGUAGE = "language"
    }
    enum PARAM_VALUE {
        static let API_KEY_VALUE = "7d56df239f3717c4641ffd5917635441"
        static let LANGUAGE_VALUE = "en-US"
    }
    enum ROUTE {
        static let GET_MOVIE_LISTS = "movie/now_playing"
    }
}
