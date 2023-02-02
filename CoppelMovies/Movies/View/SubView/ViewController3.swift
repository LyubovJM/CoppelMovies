//
//  ViewController3.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 29/01/23.
//

import UIKit

class ViewController3 : UIViewController {
    
    var response : CardMovieModel?
    
    
    init(response : CardMovieModel){
        self.response = response
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFill
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
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var movieDate: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 15)
        label.text = ""
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
        label.font = UIFont(name: "Arial Rounded MT", size: 16)
        label.text = "movieDate"
        label.textColor = .green
        label.textAlignment = .justified
        label.numberOfLines = 15
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
            configureDetails(model: response ?? .init(id: 1, url: "", title: "", date: "", rating: "", description: ""))
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
            viewMain.addSubview(stackView1)
            viewMain.addSubview(movieDesc)

            
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 10),
                imageView.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 200),
                imageView.heightAnchor.constraint(equalToConstant: 300),
                
                movieTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                movieTitle.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                movieTitle.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 30),
                movieTitle.leadingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -30),
                
                stackView1.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20),
                stackView1.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                stackView1.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 30),
                stackView1.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -30),
                
                movieDesc.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 20),
                movieDesc.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
                movieDesc.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 30),
                movieDesc.leadingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -30),
                
            ])
                stackView1.addArrangedSubview(movieDate)
                stackView1.addArrangedSubview(movieRating)
           
            
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
            print(response ?? .init(id: 1, url: "", title: "", date: "", rating: "", description: ""))
        }
    
    
    }
    

