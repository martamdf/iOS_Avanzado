//
//  HeroDetailView.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 26/2/23.
//

import Foundation
import UIKit

class HeroDetailView: UIView {
    
    let imageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = label.font.withSize(14)
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
        
        backgroundColor = .systemBackground
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 250),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ])
    }
    
    func configure(_ hero: Hero) {
        self.nameLabel.text = hero.name
        self.descriptionLabel.text = hero.heroDescription
        self.imageView.kf.setImage(with: URL(string: hero.photo))
    }
    
}
