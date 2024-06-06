//
//  APICaller.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case cannotParseData
}

class APICaller {
    static func getTrendingMovies(completionHandler: @escaping(_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil,
               let data = data,
               let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.cannotParseData))
            }
        }
        task.resume()
    }
}
