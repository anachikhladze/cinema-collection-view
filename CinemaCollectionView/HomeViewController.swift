//
//  HomeViewController.swift
//  CinemaCollectionView
//
//  Created by Anna Sumire on 03.11.23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        stackView.axis = .vertical
        return stackView
    }()
    
    private let movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        
        return collectionView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont(name: "Helvetica Bold", size: 25)
        label.text = "Now in cinemas"
        label.textColor = .white
        return label
    }()
    
    let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        return navigationBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        setupUI()
        
    }
    
    private func setupUI() {
        setupStackView()
        mainStackView.addArrangedSubview(navigationBar)
        setupNavigationBar()
        mainStackView.addArrangedSubview(titleLabel)
        setupCollectionView()
        setupNavigationBarConstraints()
    }
    
    private func setupNavigationBar() {
        let navigationItem = UINavigationItem()
        let customButton = UIButton(type: .custom)
        
        customButton.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.21, alpha: 1)
        customButton.setTitle("Profile", for: .normal)
        customButton.titleLabel?.textColor = UIColor.white
        customButton.layer.cornerRadius = 10
        customButton.frame = CGRect(x: 0, y: 0, width: 77, height: 40)
        
        let customBarButtonItem = UIBarButtonItem(customView: customButton)
        
        navigationItem.rightBarButtonItem = customBarButtonItem
        
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.barTintColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        navigationBar.isTranslucent = false
    }
    
    private func setupStackView() {
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupCollectionView() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        mainStackView.addArrangedSubview(movieCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieCollectionView.frame = view.bounds
    }
    
    private func setupNavigationBarConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
