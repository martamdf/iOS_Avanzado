//
//  LoginViewController.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 25/2/23.
//

import Foundation
import UIKit

protocol LoginDelegate {
    func dismiss()
}

class LoginViewController : UIViewController {
    
    var loginButton : UIButton?
    var emailTextfield : UITextField?
    var passwordTextfield : UITextField?
    var errorMessageView: UILabel?
    
    var viewModel: LoginViewModel?
    var delegate: LoginDelegate?
    
    init(delegate: LoginDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        let loginView = LoginView()
        
        loginButton = loginView.getLoginButtonView()
        emailTextfield = loginView.getEmailView()
        passwordTextfield = loginView.getPasswordView()
        errorMessageView = loginView.getErrorView()
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel()
        loginButton?.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
        
        #if DEBUG
        
        emailTextfield?.text = "marta.maquedano@gmail.es"
        passwordTextfield?.text = "unacontraseñasupersegura"
        
        #endif
    }
    
    @objc
    func didLoginTapped(sender: UIButton) {
        guard let email = emailTextfield?.text, let password = passwordTextfield?.text else {
            return
        }

        viewModel?.updateUI = { [weak self] token, error in
            if !token.isEmpty {
                
                if(!isKeyChainData()){
                    saveDataKeyChain(token)
                }

                self?.delegate?.dismiss()
                return
            }
            
            if !error.isEmpty {
                DispatchQueue.main.async {
                    self?.errorMessageView?.text = error
                }
                deleteDataKeyChain()
            }
        }
        
        // Call view model to perform the login call with the apiClient
        viewModel?.login(email: email, password: password)
    }
    
}
