//
//  CellCollectionViewCell.swift
//  RickAndMorty
//
//  Created by mac on 20.01.2022.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    
    private let conteinerView = UIView()
    private let imageView = CachedImageView()
    
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.backgroundColor = .black
        conteinerView.backgroundColor = .black
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(conteinerView)
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            conteinerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            conteinerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        conteinerView.addSubview(imageView)
        
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        conteinerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: conteinerView.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: conteinerView.rightAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -5)
        ])
    }
    
    func setData(with object: ResultsModel) {
        nameLabel.text = object.name
        imageView.downloadImageFrom(urlString: object.image, imageMode: .scaleAspectFill)
    }
    
}
