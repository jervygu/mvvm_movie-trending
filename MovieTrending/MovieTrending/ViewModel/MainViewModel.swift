//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import Foundation

class MainViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top movies: \(data.totalResults)")
                print("Top movies: \(data.results.count)")
            case .failure(let error):
                print("getData(): \(error.localizedDescription)")
            }
        }
    }
    
}
// https://api.themoviedb.org/3/trending/all/day?api_key=4dcc0cb5bbad7fb3209bd65aca372efe
    
