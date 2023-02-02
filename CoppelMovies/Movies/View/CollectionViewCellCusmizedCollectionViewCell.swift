//
//  CustomeCollectionViewCell.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import UIKit
import Kingfisher
class CollectionViewCellCusmizedCollectionViewCell: UICollectionViewCell {
    
    private let swiftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    let swiftStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var movieTitle: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.textAlignment = .left
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDate: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 12)
        label.textAlignment = .left
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieRating: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 12)
        label.textAlignment = .left
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDesc: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT", size: 12)
        label.textAlignment = .left
        label.textColor = .green
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(swiftStackView)
        swiftStackView.backgroundColor = UIColor(red: 0.047, green: 0.082, blue: 0.102, alpha: 1)
        
        NSLayoutConstraint.activate([
            swiftStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            swiftStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            swiftStackView.topAnchor.constraint(equalTo: topAnchor),
        ])
        
        swiftStackView.addArrangedSubview(imageView)
        swiftStackView.addArrangedSubview(movieTitle)
        swiftStackView.addArrangedSubview(swiftStackView1)
        swiftStackView.addArrangedSubview(movieDesc)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: swiftStackView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: swiftStackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: swiftStackView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            movieTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            movieTitle.centerXAnchor.constraint(equalTo: swiftStackView.centerXAnchor, constant: -40),
            
            swiftStackView1.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10),
            swiftStackView1.centerXAnchor.constraint(equalTo: swiftStackView.centerXAnchor),
            swiftStackView1.leftAnchor.constraint(equalTo: swiftStackView.leftAnchor, constant: 10),
            swiftStackView1.trailingAnchor.constraint(equalTo: swiftStackView.trailingAnchor, constant: -10),
            swiftStackView1.heightAnchor.constraint(equalToConstant: 20),
            
            movieDesc.topAnchor.constraint(equalTo: swiftStackView1.bottomAnchor, constant: 40),
        ])
        
        swiftStackView1.addArrangedSubview(movieDate)
        swiftStackView1.addArrangedSubview(movieRating)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: CardMovieModel){
        let url = model.url
        if let data = try? Data(contentsOf: URL(string: "https://image.tmdb.org/t/p/w780/\(url)")!){
            imageView.image = UIImage(data: data)
        }
        movieTitle.text = model.title
        movieDate.text = model.date
        movieRating.text = "⭐️\(model.rating)"
        movieDesc.text = model.description
    }
    
}


