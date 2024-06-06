//
//  NetworkConstant.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singleton
    }
    
    public var apiKey: String {
        get {
            // API key: https://api.themoviedb.org/3/trending/all/day?api_key=4dcc0cb5bbad7fb3209bd65aca372efe
            return "4dcc0cb5bbad7fb3209bd65aca372efe"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
