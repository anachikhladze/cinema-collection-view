//
//  MovieCell.swift
//  CinemaCollectionView
//
//  Created by Anna Sumire on 03.11.23.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont(name: "Helvetica Bold", size: 18)
        label.textColor = .white
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.39, green: 0.45, blue: 0.58, alpha: 1)
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "heart.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    var isLiked: Bool = false {
        didSet {
            heartButton.tintColor = isLiked ? .red : .gray
        }
    }
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = nil
    }
    
    private func setupUI() {
        contentView.addSubview(movieImageView)
        contentView.addSubview(heartButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 278),
            movieImageView.widthAnchor.constraint(equalToConstant: 164),
            
            heartButton.widthAnchor.constraint(equalToConstant: 20),
            heartButton.widthAnchor.constraint(equalToConstant: 20),
            heartButton.topAnchor.constraint(equalTo: movieImageView.topAnchor),
            heartButton.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -40),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    func configure(with model: Movie) {
        movieImageView.image = model.image
        titleLabel.text = model.name
        genreLabel.text = model.genre.stringValue()
    }
    
    private func setupActions() {
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    
    @objc private func heartButtonTapped() {
        isLiked.toggle()
    }
}
