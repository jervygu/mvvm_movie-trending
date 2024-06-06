//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import UIKit

class MainViewController: UIViewController {
    
    
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    // Variables
    var cellDataSource: [MovieTableViewCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        self.title = "Main"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self,
                  let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetail(movieID: Int) {
        guard let movie = viewModel.retrieveMovie(with: movieID) else { return }
        
        let detailsViewModel = MovieDetailsViewModel(movie: movie)
        let detailsVC = MovieDetailsViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

