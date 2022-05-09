//
//  RealmHelper.swift
//  2022Movie
//
//  Created by Aye Chan Moe on 2/12/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//
import Foundation
import Realm
import RealmSwift
import SwiftUI

class RealmHelper {
    
    private init() {}
    
    static let shared = RealmHelper()
    
    let realm = try! Realm(configuration: Realm.Configuration(schemaVersion: 1))
    
    //        let realm = try! Realm(configuration: Realm.Configuration(schemaVersion: 1))
    
    func insertNowplayinMovie(insertNowplayingVO: NowplayingVO) {
        
        try! realm.write({
            realm.add(insertNowplayingVO,update: .modified)
        })
//        shit code
//        try! realm.write({
//            if let retrieveNowplayingVO = realm.objects(NowplayingVO.self).first {
//
//                insertNowplayingVO.results.forEach { insertMovie in
//                    var notExist = true
//                    retrieveNowplayingVO.results.forEach { retrieveMovie in
//
//                        if insertMovie.id == retrieveMovie.id {
//                            notExist = false
//                        }
//                    }
//                    if notExist {
//                        retrieveNowplayingVO.results.append(objectsIn: insertNowplayingVO.results)
//                    }
//                }
//            } else {
//                realm.add(insertNowplayingVO)
//            }
//
//        })
//
    }
    
    //                if let retrieveNowplayingVO = realm.objects(NowplayingVO.self).first {
    //                   retrieveNowplayingVO.results.forEach { retrieveMovie in
    //                        insertNowplayingVO.results.forEach { insertMovie in
    //                            if let insertMovie = insertMovie, let retrieveMovie = retrieveMovie {
    //                    retrieveNowplayingVO.results.forEach { retrieveMovie in
    //                        guard let retrieveMovie = retrieveMovie else {return}
    //                        retrieveNowplayingVO.results.append(objectsIn: insertNowplayingVO.results.filter({ movieVO in
    //                            (retrieveMovie.id ?? 0 ) != movieVO?.id
    //                        }))
    //
    //                                                            }
    
    //                            }
    //                        }
    //                    }
    //                } else {
    //                    realm.add(insertNowplayingVO)
    //                }
    //            })
    //        }
    // Read
    func retrieveNowplayingMovie() -> Results<NowplayingVO> {
             // print("\(realm.objects(NowplayingVO.self))")
        return realm.objects(NowplayingVO.self)
        
    }
    
    // Favourite State for Nowplaying Create & Update
    func insertNowplayingFavouriteState(favouriteState: NowPlayingFavouriteStateVO) {
       try! realm.write {
            realm.add(favouriteState, update: .modified)
        }
       
    }
    
    // Favourite State for Nowplaying retrieve favourite state
    func retrieveNowplayingFavouriteState() -> Results<NowPlayingFavouriteStateVO> {
        return realm.objects(NowPlayingFavouriteStateVO.self)
    }
}
