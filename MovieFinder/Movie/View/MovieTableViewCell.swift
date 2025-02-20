//
//  MovieTableViewCell.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.moviePosterImageView.layer.cornerRadius = Constants.ViewLayerConstants.MoviePoster.cornerRadius
            self.moviePosterImageView.layer.masksToBounds = Constants.ViewLayerConstants.MoviePoster.masksToBounds
            self.moviePosterImageView.layer.borderWidth = Constants.ViewLayerConstants.MoviePoster.borderWidth
            self.moviePosterImageView.layer.borderColor = Constants.ViewLayerConstants.MoviePoster.borderColor
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateMovieCell(movie: Movie) {
        if let title = movie.title {
            movieTitleLabel.text = title
        }
        
        if let year = movie.year {
            movieYearLabel.text = year
        }
        
        if let poster = movie.poster, let posterURL = URL(string: poster) {
            loadMoviePoster(posterURL)
        } else {
            // If the poster URL is nil
            moviePosterImageView.image = UIImage(named: Constants.ImageNames.placeholder)
        }
    }
    
    func loadMoviePoster(_ posterURL: URL) {
        let placeholder = UIImage(named: Constants.ImageNames.placeholder)
        moviePosterImageView.sd_setImage(with: posterURL,
                                         placeholderImage: placeholder,
                                         options: .highPriority) { [weak self] (image, error, cacheType, url) in
            if let _ = error {
                // If there is an error (e.g. invalid URL)
                self?.moviePosterImageView.image = UIImage(named: Constants.ImageNames.placeholder)
            }
        }
    }
}
