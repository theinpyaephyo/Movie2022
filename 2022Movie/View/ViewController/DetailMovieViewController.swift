//
//  DetailMovieViewController.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class DetailMovieViewController: UIViewController {

    static let identifier = "DetailMovieViewController"
    
    @IBOutlet weak var btnBack: UIView!
    @IBOutlet weak var btnFavourite: UIView!
    @IBOutlet weak var imgFavourite: UIImageView!
    @IBOutlet weak var imgMoviePoster: UIImageView!
    
    var movieDetail = MovieDetailVO()
    
    var movieId: Int? {
        didSet {
            if let movieID = movieId {
                UserDataModel.shared.getMovieDetail(movieId: movieID, success: { (movie) in
                    self.movieDetail = movie
                    self.loadInitial()
                }) { (err) in
                    print(err)
                }
            }
        }
    }
    // Favourite State
       var favouriteState: Bool? {
           didSet {
               if let favouriteState = favouriteState {
                   if favouriteState {
                       imgFavourite.tintColor = .red
                   } else {
                       imgFavourite.tintColor = .systemBackground
                   }
               }
           }
       }
    var index: Int?
    var favouriteStateDelegate: FavouriteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // back to MainViewController
        btnBack.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapBack))
        btnBack.addGestureRecognizer(tapGesture)
        
        // favourite button onClick
        btnFavourite.isUserInteractionEnabled = true
        let tapGestureFavourite = UITapGestureRecognizer(target: self, action: #selector(onTapFavourite))
        btnFavourite.addGestureRecognizer(tapGestureFavourite)
    }
    func loadInitial() {
        let imgUrl = SharedConstants.posterPath + (self.movieDetail.posterPath ?? "")
        self.imgMoviePoster.sd_setImage(with: URL(string: imgUrl))
    }
    @objc func onTapBack() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func onTapFavourite() {
//        if let index = index, let favouriteState = favouriteState {
//            if !favouriteState {
//                imgFavourite.tintColor = .red
//            } else {
//                imgFavourite.tintColor = .systemBackground
//            }
//            favouriteStateDelegate?.onTapFavourite(index: index, favouriteState: !favouriteState)
//        }
    }
}
