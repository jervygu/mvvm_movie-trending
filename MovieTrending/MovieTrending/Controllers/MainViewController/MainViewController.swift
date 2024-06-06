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
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        self.title = "Main"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getData()
    }
}

