//
//  UserDataModel.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserDataModel {
    private init() {}
    
    static let shared = UserDataModel()
    
    let decoder = JSONDecoder()
    
    func getNowplayingMovieList(page: Int = 1,
                                success: @escaping () -> Void,
                                failure: @escaping (String) -> Void)  {
        let parameters: [String:Any] = [
            SharedConstants.PARAM_KEY.API_KEY : SharedConstants.PARAM_VALUE.API_KEY_VALUE,
            SharedConstants.PARAM_KEY.LANGUAGE : SharedConstants.PARAM_VALUE.LANGUAGE_VALUE,
            SharedConstants.PARAM_KEY.PAGE : page
        ]
        NetworkClient.shared.getData(route: SharedConstants.ROUTE.GET_MOVIE_LISTS, parameters: parameters, httpHeaders: [:], success: { (data) in
           
            guard let data = data as? JSON else { return }
            
            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let movies = try self.decoder.decode(NowplayingVO.self, from: Data(data.rawData()))
             
                RealmHelper.shared.insertNowplayinMovie(insertNowplayingVO: movies)
                
                // check network is working or not
                
                movies.results.forEach { movie in
                    let favState = NowPlayingFavouriteStateVO()
                    favState.movieID = movie.id
                    favState.favouriteState = false
                    RealmHelper.shared.insertNowplayingFavouriteState(favouriteState: favState)
                }
               
                success()

            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
            
        }) { (err) in
            print(err)
        }
    }
  
    
    func getMovieDetail(movieId: Int,
                        success: @escaping (MovieDetailVO) -> Void,
                        failure: @escaping (String) -> Void) {
        let parameters: [String:Any] = [
            SharedConstants.PARAM_KEY.API_KEY : SharedConstants.PARAM_VALUE.API_KEY_VALUE,
            SharedConstants.PARAM_KEY.LANGUAGE : SharedConstants.PARAM_VALUE.LANGUAGE_VALUE
        ]
        let route = "movie/\(movieId)"
        NetworkClient.shared.getData(route: route, parameters: parameters, httpHeaders: [:], success: { (data) in
            guard let data = data as? JSON else { return }
            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let movieDetail = try self.decoder.decode(MovieDetailVO.self, from: Data(data.rawData()))
                success(movieDetail)
            } catch let jsonErr {
                print(jsonErr.localizedDescription)
            }
            
            
        }) { (err) in
            print(err)
        }
    }
}
