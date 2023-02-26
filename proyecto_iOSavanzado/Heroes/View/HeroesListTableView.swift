//
//  HeroesListTableView.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 24/2/23.
//
import Foundation
import UIKit

class HeroesListTableView : UIView {

    let headerLabel = {
        let label = UILabel()
        label.text = "Heroes"
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoutButton : UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal )
        button.backgroundColor = .systemBlue
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
//        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchBar = {
        let searchBar = UISearchBar()
        searchBar.barStyle = .default
        searchBar.backgroundColor = .white
        searchBar.isTranslucent = true
        searchBar.text = ""
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.borderStyle = .none
        
        return searchBar
    }()
    
    let heroesTableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HeroeListViewCell.self, forCellReuseIdentifier: "HeroeListViewCell")
        return tableView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        backgroundColor = .systemBackground
        
        addSubview(headerLabel)
        addSubview(logoutButton)
        addSubview(searchBar)
        addSubview(heroesTableView)
        
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),
            
            logoutButton.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logoutButton.heightAnchor.constraint(equalToConstant: 30),

            searchBar.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heroesTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
