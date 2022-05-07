//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by mac on 01.02.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var object: (image: String, name: String, status: String, species: String,
                         gender: String, origin: String, location: String)?
    init(with object: (image: String, name: String, status: String, species: String,
                       gender: String, origin: String, location: String)) {
        super.init(nibName: nil, bundle: nil)
        self.object = object
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        object = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let conteinerView = UIView()
    private let imageView = CachedImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let speciesLabel = UILabel()
    private let genderLabel = UILabel()
    private let originLabel = UILabel()
    private let locationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
}

// MARK: - Setup UI Elements

private extension DetailViewController {
    
    private func setupSubviews() {
        view.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = false
        title = object?.name ?? ""
        
        conteinerView.backgroundColor = .black
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(conteinerView)
        
        imageView.layer.cornerRadius = view.bounds.width * 0.8 / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.downloadImageFrom(urlString: object?.image ?? "", imageMode: .scaleAspectFill)
        conteinerView.addSubview(imageView)
        
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name:   " + (object?.name ?? "")
        conteinerView.addSubview(nameLabel)
        
        statusLabel.textColor = .white
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Status:   " + (object?.status ?? "")
        conteinerView.addSubview(statusLabel)
        
        speciesLabel.textColor = .white
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.text = "Species:   " + (object?.species ?? "")
        conteinerView.addSubview(speciesLabel)
        
        genderLabel.textColor = .white
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender:   " + (object?.gender ?? "")
        conteinerView.addSubview(genderLabel)
        
        originLabel.textColor = .white
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.text = "Origin:   " + (object?.origin ?? "")
        conteinerView.addSubview(originLabel)
        
        locationLabel.textColor = .white
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = "Location:   " + (object?.location ?? "")
        conteinerView.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: view.topAnchor),
            conteinerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            conteinerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 5),
            imageView.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: conteinerView.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: conteinerView.widthAnchor, multiplier: 0.8),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor, constant: -5),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            statusLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor, constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor, constant: -5),
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            speciesLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor, constant: 5),
            speciesLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor, constant: -5),
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 5),
            genderLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor, constant: 5),
            genderLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor, constant: -5),
            originLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5),
            originLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor, constant: 5),
            originLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor, constant: -5),
            locationLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 5),
            locationLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor, constant: 5),
            locationLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor, constant: -5),
            locationLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
}
