//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableViewCellViewModel]> = Observable(nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top movies: \(data.totalResults)")
                print("Top movies: \(data.results.count)")
                
                self.dataSource = data
                self.mapCellData()
            case .failure(let error):
                print("getData(): \(error.localizedDescription)")
            }
        }
    }
    
    func mapCellData() {
//        self.cellDataSource.value = self.dataSource?.results ?? []
        self.cellDataSource.value = self.dataSource?.results.compactMap({ MovieTableViewCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
}
// https://api.themoviedb.org/3/trending/all/day?api_key=4dcc0cb5bbad7fb3209bd65aca372efe
    
