//
//  LoginView.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let titleLabel = {
        let label = UILabel()
        label.text = "Login"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .gray.withAlphaComponent(0.2)
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let passwordTextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .gray.withAlphaComponent(0.2)
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton = {
        let button = UIButton()
        
        button.setTitle("acceder", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let errorMessageLabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -40),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            errorMessageLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            errorMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            errorMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            errorMessageLabel.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func getEmailView() -> UITextField {
        return emailTextField
    }
    
    func getPasswordView() -> UITextField {
        return passwordTextField
    }
    
    func getLoginButtonView() -> UIButton {
        return loginButton
    }
    
    func getErrorView() -> UILabel {
        return errorMessageLabel
    }

}

