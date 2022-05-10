//
//  MovieListsTableViewCell.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class MovieListsTableViewCell: UITableViewCell {
    
    static let identifier = "MovieListsTableViewCell"
    
    @IBOutlet weak var tranparentView: UIView!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var favouriteView: UIView!
    @IBOutlet weak var favouriteImage: UIImageView!
    @IBOutlet weak var outerVotingView: UIView!
    @IBOutlet weak var innerVotingView: UIView!
    @IBOutlet weak var lblshowVoting: UILabel!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    // Movie image
    var movieVO: MoviesVO? {
        didSet {
            if let movie = movieVO {
                let imgUrl = SharedConstants.posterPath + ( movie.posterPath ?? "")
                imgMovie.sd_setImage(with: URL(string: imgUrl))
            }
        }
    }
    // favourite State
    var favouriteDelegate: FavouriteDelegate?
    var favouriteStateVO: NowPlayingFavouriteStateVO? {
        didSet {
            if let favouriteStateVO = favouriteStateVO {
                if let state = favouriteStateVO.favouriteState {
                    if state {
                        favouriteImage.tintColor = .red
                    } else {
                        favouriteImage.tintColor = .systemBackground
                    }
                }
            }
        }
    }
//    var favouriteState: Bool? {
//        didSet {
//            if let favouriteState = favouriteState {
//                if favouriteState {
//                    favouriteImage.tintColor = .red
//                } else {
//                    favouriteImage.tintColor = .systemBackground
//                }
//            }
//        }
//    }
//    var movieId: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // favourite color change effect
        favouriteView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapFavourite))
        favouriteView.addGestureRecognizer(tapGesture)
        
        
    }
    @objc func onTapFavourite() {
        if let favouriteState = self.favouriteStateVO?.favouriteState, let movieId = self.favouriteStateVO?.movieID {
            favouriteDelegate?.onTapFavourite(movieId: movieId, favouriteState: !favouriteState)
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
