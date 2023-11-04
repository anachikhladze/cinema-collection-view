//
//  HomeVC+CollectionView.swift
//  CinemaCollectionView
//
//  Created by Anna Sumire on 03.11.23.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Movie.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentMovie = Movie.list[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath)
            as? MovieCell {
            cell.configure(with: currentMovie)
            cell.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = Movie.list[indexPath.row]
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movie = selectedMovie
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.size.width/2.5),
               height: (view.frame.size.height/3)-3)
    }
}
