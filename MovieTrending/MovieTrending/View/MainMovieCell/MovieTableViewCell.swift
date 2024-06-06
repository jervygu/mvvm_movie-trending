//
//  MainMovieTableViewCell.swift
//  MovieTrending
//
//  Created by Jervy Umandap on 6/6/24.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MovieTableViewCell"
        }
    }
    
    public static func register() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    // IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(borderColor: .label, borderWidth: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableViewCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
}
