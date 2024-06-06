//
//  MovieTableViewCellViewModel.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import Foundation

class MovieTableViewCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
//    init(id: Int, title: String, date: String, rate: String, imageUrl: URL? = nil) {
//        self.id = id
//        self.title = title
//        self.date = date
//        self.rating = rate
//        self.imageUrl = imageUrl
//    }
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.imageUrl = makeImageUrl(movie.posterPath)
    }
    private func makeImageUrl(_ imageCode: String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
