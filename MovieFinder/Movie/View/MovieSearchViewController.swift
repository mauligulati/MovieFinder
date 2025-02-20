//
//  MovieViewController.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import UIKit

class MovieSearchViewController: UIViewController {
    
    @IBOutlet weak var searchMovieTextField: UITextField!
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var movieViewModel: MovieSearchViewModel!
    private var movies: [Movie] = [] {
        didSet {
            movieTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieViewModel()
    }
    
    func setupMovieViewModel() {
        movieViewModel = MovieSearchViewModel()
        movieViewModel.delegate = self
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        self.movies = []
        activityIndicator.startAnimating()
        guard let movieTitle = searchMovieTextField.text, !movieTitle.isEmpty else {
            self.activityIndicator.stopAnimating()
            AlertManager.showAlert(on: self,
                                   title: Constants.AlertMovieSearch.title,
                                   message: Constants.AlertMovieSearch.message,
                                   actionTitle: Constants.AlertMovieSearch.actionTitle)
            return
        }
        let movieSearchString = APIConfig.getSearchURL(for: movieTitle)
        movieViewModel.getMovieList(movieSearchString: movieSearchString)
    }
}

extension MovieSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.movieCell, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        DispatchQueue.main.async {
            cell.updateMovieCell(movie: movie)
        }
        return cell
    }
}

extension MovieSearchViewController: MovieSearchViewModelDelegate {
    func didFetchMovies(_ movies: [Movie]) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.movies = movies
        }
    }
    
    func didFailWithError(_ error: NetworkError) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            AlertManager.showAlert(on: self,
                                   title: error.alertTitle,
                                   message: error.handleError(error: error),
                                   actionTitle: Constants.AlertMovieSearch.actionTitle)
        }
    }
}

