//
//  ViewController.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 26/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var presenter = LoginPresenter()
    
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
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TheMovieDB")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .purple
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical

        stackView.distribution = .fill
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Arial Rounded MT", size: 15)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Username"
        textField.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Arial Rounded MT", size: 15)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        
        return textField
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
    
    lazy var errorCredentials: UILabel = {
       var label = UILabel()
        label.text = "Invalid userName and/or password. You did not provide a valid login"
        label.textColor = .red
        label.isHidden = true
        label.textAlignment = .justified
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(scrollView)
        scrollView.backgroundColor =  UIColor(red: 0.047, green: 0.082, blue: 0.102, alpha: 1)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        scrollView.addSubview(viewMain)
        viewMain.backgroundColor = UIColor(red: 0.047, green: 0.082, blue: 0.102, alpha: 1)
        NSLayoutConstraint.activate([
            viewMain.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewMain.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 50),
            viewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewMain.heightAnchor.constraint(equalToConstant: 700)
        ])
    
        viewMain.addSubview(imageView)
        viewMain.addSubview(stackView1)
        viewMain.addSubview(errorCredentials)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 250),
            imageView.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            stackView1.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
            stackView1.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 60),
            stackView1.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -60),
            
            errorCredentials.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 30),
            errorCredentials.centerXAnchor.constraint(equalTo: viewMain.centerXAnchor),
            errorCredentials.widthAnchor.constraint(equalToConstant: 275)
            
        ])
        
        stackView1.addArrangedSubview(usernameTextField)
        stackView1.addArrangedSubview(passwordTextField)
        stackView1.addArrangedSubview(loginButton)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: stackView1.topAnchor),
            usernameTextField.centerXAnchor.constraint(equalTo: stackView1.centerXAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor ,constant: 30),
            passwordTextField.centerXAnchor.constraint(equalTo: stackView1.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: stackView1.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        
    }

        @objc
        private func loginFunc() {
            if usernameTextField.isNotBlank() && passwordTextField.isNotBlank() {
                Task{
                    let login = await presenter.login(username:  usernameTextField.text!,password: passwordTextField.text!)
                    
                    errorCredentials.text = login.message
                    
                    if login.status {
                        //ir a movies
                        self.navigationController?.pushViewController(ViewController2(), animated: true)
                    }else{
                        errorCredentials.isHidden = false
                        errorCredentials.text = "Invalid userName and/or password. You did not provide a valid login"
                    }
                }
            }else{
                errorCredentials.isHidden = false
                errorCredentials.text = "Invalid Credentials, there is not characters introduced"
            }
            
        }
    
}
