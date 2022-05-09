//
//  FavouriteDelegate.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/9/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
protocol FavouriteDelegate {
    func onTapFavourite(movieId: Int, favouriteState: Bool) 
}
