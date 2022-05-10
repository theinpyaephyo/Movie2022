//
//  MainViewController.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SwiftUI
import RealmSwift
import Realm

class MainViewController: UIViewController {

    static let identifier = "MainViewController"
    
    @IBOutlet weak var MovieListsTableView: UITableView!
    
    var movies: [MoviesVO] = []
    
    var favouriteState: [NowPlayingFavouriteStateVO] = []
    
    var totPages:Int = 0
    
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Realm is located at:", Realm.Configuration.defaultConfiguration.fileURL as Any)
       
        MovieListsTableView.register(UINib(nibName: MovieListsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovieListsTableViewCell.identifier)
        
        MovieListsTableView.dataSource = self
        
        MovieListsTableView.delegate = self
        
        
        loadInitial()
    }
    func loadInitial() {
        UserDataModel.shared.getNowplayingMovieList {
           
            guard let nowplayingVO = RealmHelper.shared.retrieveNowplayingMovie().first else { return }
            // get total pages from network
            if let totPages = nowplayingVO.totalPages {
                self.totPages = totPages
            }
            
            nowplayingVO.results.forEach { movie in
               
                        self.movies.append(movie)
                
                }
            RealmHelper.shared.retrieveNowplayingFavouriteState().forEach { favouriteStateVO in
            
                    self.favouriteState.append(favouriteStateVO)
          
            }
          
            self.MovieListsTableView.reloadData()
            
        } failure: { err in
            print(err)
        }

//        UserDataModel.shared.getNowplayingMovieList(success: { (nowplayinMovies) in
//            guard let nowplayingmovies = nowplayinMovies.results else { return }
//            self.movies = nowplayingmovies
//            self.totPages = nowplayinMovies.totalPages ?? 0
//            //favourite state
//            for _ in 0..<self.movies.count {
//                self.favouriteState.append(false)
//            }
//
//            self.MovieListsTableView.reloadData()
//        }) { (err) in
//            print(err)
//        }
    }
    func loadMore(page: Int)  {
        UserDataModel.shared.getNowplayingMovieList(page: page) {
            RealmHelper.shared.retrieveNowplayingMovie()[page-1].results.forEach({ movie in
                self.movies.append(movie)
            })
            self.MovieListsTableView.reloadData()
        } failure: { err in
            print(err)
        }

//        UserDataModel.shared.getNowplayingMovieList(page: page, success: { (nowplayingMovies) in
//            guard let nowplayingMovies = nowplayingMovies.results else { return }
//            self.movies.append(contentsOf: nowplayingMovies)
//            // favourite state
//            nowplayingMovies.forEach { _ in
//                self.favouriteState.append(false)
//            }
//
//            self.MovieListsTableView.reloadData()
//        }) { (err) in
//            print(err)
//        }
    }
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListsTableViewCell.identifier, for: indexPath)as! MovieListsTableViewCell
        cell.movieVO = movies[indexPath.row]
        cell.favouriteStateVO = favouriteState[indexPath.row]
//        cell.favouriteState = favouriteState[indexPath.row]
//        cell.movieId = movies[indexPath.row].id
        cell.favouriteDelegate = self
        return cell
    }
    
    
}
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: DetailMovieViewController.identifier)as DetailMovieViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        vc.movieId = self.movies[indexPath.row].id
//        vc.favouriteState = self.favouriteState[indexPath.row]
        vc.index = indexPath.row
        vc.favouriteStateDelegate = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if page <= totPages {
            page += 1
             loadMore(page: page)
        }
       
    }
}
extension MainViewController: FavouriteDelegate {
    func onTapFavourite(movieId: Int, favouriteState: Bool) {
        let favState = NowPlayingFavouriteStateVO()
        favState.movieID = movieId
        favState.favouriteState = favouriteState
        RealmHelper.shared.insertNowplayingFavouriteState(favouriteState: favState)
//        self.favouriteState[index] = favouriteState
        MovieListsTableView.reloadData()
    }
}
