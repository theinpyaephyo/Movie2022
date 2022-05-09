//
//  GenreVO.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class GenreVO: Object, Codable {
    @Persisted(primaryKey: true) var id: Int?
    @Persisted var name: String?
}
