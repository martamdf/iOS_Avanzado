//
//  HeroeListViewCell.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 24/2/23.
//

import Foundation
import UIKit
import Kingfisher

class HeroeListViewCell: UITableViewCell {
    
    let heroeImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let heroeName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroeDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        backgroundColor = .systemBackground
        
        addSubview(heroeImageVIew)
        addSubview(heroeName)
        addSubview(heroeDescription)
        
        NSLayoutConstraint.activate([
            heroeImageVIew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            heroeImageVIew.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            heroeImageVIew.heightAnchor.constraint(equalToConstant: 80),
            heroeImageVIew.widthAnchor.constraint(equalToConstant: 80),
            
            heroeName.leadingAnchor.constraint(equalTo: heroeImageVIew.trailingAnchor, constant: 10),
            heroeName.topAnchor.constraint(equalTo: heroeImageVIew.topAnchor),
            heroeName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            heroeDescription.leadingAnchor.constraint(equalTo: heroeImageVIew.trailingAnchor, constant: 10),
            heroeDescription.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: -20),
            heroeDescription.topAnchor.constraint(equalTo: heroeName.bottomAnchor, constant: 8)
        ])
    }
    
    func configure(_ hero: Hero) {
        self.heroeName.text = hero.name
        self.heroeDescription.text = hero.heroDescription
        self.heroeImageVIew.kf.setImage(with: URL(string: hero.photo))
    }
    
}
