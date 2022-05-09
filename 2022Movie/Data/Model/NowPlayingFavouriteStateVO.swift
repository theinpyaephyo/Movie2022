//
//  NowPlayingFavouriteStateVO.swift
//  2022Movie
//
//  Created by Aye Chan Moe on 2/15/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
import RealmSwift

class NowPlayingFavouriteStateVO: Object, Codable {
    @Persisted(primaryKey: true) var movieID: Int?
    @Persisted var favouriteState: Bool?
}
