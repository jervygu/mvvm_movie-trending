//
//  MovieDetailsViewModel.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview
        self.movieImage = makeImageUrl(movie.backdropPath)
        //
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
