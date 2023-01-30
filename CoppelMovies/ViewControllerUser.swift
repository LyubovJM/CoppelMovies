//
//  ViewControllerUser.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 26/01/23.
//

import UIKit

class VIewControllerUser: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.contentMode = .scaleAspectFill
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private let viewMain: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFill
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()
    
    private let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        stackView.distribution = .fill
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Avatar")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .purple
        imageView.layer.cornerRadius = 150

        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var profileLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.text = "Profile"
        label.textColor = .green
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 15)
        label.text = "@username"
        label.textColor = .green
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var favoriteShowsLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 15)
        label.text = "Favorite Shows"
        label.textColor = .green
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 1500)
        ])
        
        scrollView.addSubview(viewMain)
        
        NSLayoutConstraint.activate([
            viewMain.topAnchor.constraint(equalTo: view.topAnchor),
            viewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        viewMain.backgroundColor = UIColor(red: 0.047, green: 0.082, blue: 0.102, alpha: 1)
        viewMain.addSubview(profileLabel)
        viewMain.addSubview(stackView1)
        viewMain.addSubview(favoriteShowsLabel)
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 20),
            profileLabel.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor, constant: -150),
            
            stackView1.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 50),
            stackView1.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
            stackView1.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 30),
            stackView1.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -30),
            
            favoriteShowsLabel.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 100),
            favoriteShowsLabel.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor, constant: -120),
        ])
        
        stackView1.addArrangedSubview(imageView)
        stackView1.addArrangedSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
}

