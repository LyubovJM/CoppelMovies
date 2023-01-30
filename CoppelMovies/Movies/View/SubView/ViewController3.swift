//
//  ViewController3.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 29/01/23.
//

import UIKit

class ViewController3 : UIViewController {
    
    lazy var movies : [CardMovieModel] = []
    
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
    
    private lazy var movieTitle: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.text = ""
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
    
    private lazy var movieDate: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 15)
        label.text = "movieDate"
        label.textColor = .green
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private lazy var movieRating: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 15)
        label.text = "movieDate"
        label.textColor = .green
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var movieDesc: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 15)
        label.text = "movieDate"
        label.textColor = .green
        label.textAlignment = .left
        label.numberOfLines = 6
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Log In"
        configuration.titleAlignment = .center
        configuration.baseBackgroundColor = UIColor(red: 0.900, green: 0.900, blue: 0.900, alpha: 1.0)
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .large
        
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: {_ in
            self.loginFunc()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
                viewMain.heightAnchor.constraint(equalToConstant: 1500)
            ])
            
            viewMain.backgroundColor = UIColor(red: 0.047, green: 0.082, blue: 0.102, alpha: 1)
            
            viewMain.addSubview(imageView)
            viewMain.addSubview(movieTitle)
            viewMain.addSubview(movieDate)
            viewMain.addSubview(movieRating)
            viewMain.addSubview(movieDesc)
            viewMain.addSubview(loginButton)
            
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 10),
                imageView.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                
                movieTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                movieTitle.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor, constant: -150),
                
                movieDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20),
                movieDate.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                
                movieRating.topAnchor.constraint(equalTo: movieDate.bottomAnchor, constant: 20),
                movieRating.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                
                movieDesc.topAnchor.constraint(equalTo: movieRating.bottomAnchor, constant: 20),
                movieDesc.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                
                loginButton.topAnchor.constraint(equalTo: movieDesc.bottomAnchor, constant: 20),
                loginButton.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor)
            ])
            
            
        }
        
        func configureDetails(model: CardMovieModel){
            let url = model.url
            if let data = try? Data(contentsOf: URL(string: "https://image.tmdb.org/t/p/w780/\(url)")!){
                imageView.image = UIImage(data: data)
            }
            movieTitle.text = model.title
            movieDate.text = model.date
            movieRating.text = "⭐️\(model.rating)"
            movieDesc.text = model.description
        }
        
        func loginFunc() {
            print(movies)
        }
    }
    

