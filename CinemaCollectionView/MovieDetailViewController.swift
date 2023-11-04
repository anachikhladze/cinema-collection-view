//
//  MovieDetailViewController.swift
//  CinemaCollectionView
//
//  Created by Anna Sumire on 04.11.23.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    var movie: Movie?
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 35, left: 52, bottom: 35, right: 52)
        return stackView
    }()
    
    private let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .leading
        return stackView
    }()
    
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        let navigationItem = UINavigationItem()
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.barTintColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        navigationBar.isTranslucent = false
        
        return navigationBar
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let IMDBLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let certificateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private let selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select session", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.21, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureWithMovie()
    }
    
    private func setup() {
        setupBackground()
        addSubviewsToView()
        setupMainStackView()
        setupDescriprtionStackView()
        setupConstraints()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
    }
    
    private func addSubviewsToView() {
        view.addSubview(mainStackView)
    }
    
    private func setupMainStackView() {
        mainStackView.addArrangedSubview(navigationBar)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(movieImageView)
        mainStackView.addArrangedSubview(ratingLabel)
        mainStackView.addArrangedSubview(IMDBLabel)
        mainStackView.addArrangedSubview(descriptionStackView)
        mainStackView.addArrangedSubview(selectButton)
    }
    
    private func setupDescriprtionStackView() {
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(certificateLabel)
        descriptionStackView.addArrangedSubview(runtimeLabel)
        descriptionStackView.addArrangedSubview(releaseLabel)
        descriptionStackView.addArrangedSubview(genreLabel)
        descriptionStackView.addArrangedSubview(directorLabel)
        descriptionStackView.addArrangedSubview(castLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 64),
            
            movieImageView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 210),
            
            mainStackView.topAnchor.constraint(equalTo: IMDBLabel.bottomAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            descriptionStackView.topAnchor.constraint(equalTo: IMDBLabel.bottomAnchor, constant: 16),
            descriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            selectButton.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: 66),
            selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            selectButton.widthAnchor.constraint(equalToConstant: 343),
            selectButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func configureWithMovie() {
        if let movie = movie {
            configureView(with: movie)
        }
    }
    
    private func configureView(with movie: Movie) {
        titleLabel.text = movie.name
        descriptionLabel.text = movie.description
        ratingLabel.text = String(movie.rating)
        IMDBLabel.text = "IMDB"
        certificateLabel.text = movie.certificate
        releaseLabel.text = String(movie.release)
        genreLabel.text = movie.genre.stringValue()
        castLabel.text = movie.cast.randomElement()
        directorLabel.text = movie.director
        runtimeLabel.text = movie.runtime
    }
}
