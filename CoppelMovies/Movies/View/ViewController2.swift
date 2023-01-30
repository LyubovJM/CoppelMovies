//
//  ViewController2.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 26/01/23.
//

import UIKit

open class ViewController2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    lazy var movies : [CardMovieModel] = []
    
    lazy var presenter = MoviesPresenter()
        
    var imageView1: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Popular Movies"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        let titleTextAttributes2 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
        
        let sc = UISegmentedControl(items: ["Popular", "Top Rated", "On Tv", "Airing Today"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentTintColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        sc.backgroundColor = UIColor(red: 0.098, green: 0.125, blue: 0.149, alpha: 1)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentedControlChange(_:)), for: .valueChanged)
        return sc
    }()
    
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
    
    private lazy var swiftCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //     layout.scrollDirection = .horizontal (kind scrolling)
        layout.itemSize = .init(width: 170, height: 200)
        layout.minimumLineSpacing = 150//(spacing with lines)
        layout.minimumInteritemSpacing = 0 //(spacing with items)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    open override func viewDidLoad() {
        Task(priority: .high) {
            await loadData()
        }
        Task(priority: .low) {
            swiftCollectionView
        }
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "⫶", style: .done, target: self, action: #selector(toControllUser))
        
        view.backgroundColor = UIColor(red: 0.188, green: 0.216, blue: 0.227, alpha: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 80),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            
            scrollView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        scrollView.addSubview(viewMain)
        
        NSLayoutConstraint.activate([
            viewMain.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5),
            viewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewMain.heightAnchor.constraint(equalToConstant: 1500)
        ])
        
        viewMain.backgroundColor = .black
        
        swiftCollectionView.dataSource = self
        swiftCollectionView.delegate = self
        swiftCollectionView.register(CollectionViewCellCusmizedCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCellCusmizedCollectionViewCell")
        viewMain.addSubview(swiftCollectionView)
        swiftCollectionView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            swiftCollectionView.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 10),
            swiftCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            swiftCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            swiftCollectionView.bottomAnchor.constraint(equalTo: viewMain.bottomAnchor),
            swiftCollectionView.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
 
        ])
        
    }

    private func loadData() async {
        movies = await presenter.popularMovies()
        swiftCollectionView.reloadData()
        swiftCollectionView.reloadInputViews()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellCusmizedCollectionViewCell", for: indexPath) as! CollectionViewCellCusmizedCollectionViewCell
        
        cell.backgroundColor = .black
        
        let model = movies[indexPath.row]
        cell.configure(model: model)
        return cell
        
    }
    
    public func collectionView(_ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.present(ViewController3(), animated: true)
    }
        
        @objc
        private func toControllUser() {
            self.navigationController?.present(VIewControllerUser(), animated: true)
        }
    
        @objc
        func handleSegmentedControlChange(_ sc: UISegmentedControl!) {
        if segmentedControl.selectedSegmentIndex == 0 {
            titleLabel.text = "Popular Movies"
        }else if segmentedControl.selectedSegmentIndex == 1 {
            titleLabel.text = "Top Rated Movies"

        }else if segmentedControl.selectedSegmentIndex == 2 {
            titleLabel.text = "Movies On TV"
        }else{
            titleLabel.text = "Airing Today"
        }
    }

}

