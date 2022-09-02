//
//  CharacterCellContainerView.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import UIKit
import Kingfisher

class CharacterCardContainerView: GenericBaseView<CharacterCardData> {
    // MARK: Constants
    private let spacingValue: CGFloat = 5
    
    // MARK: Components
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = spacingValue
        temp.alignment = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleToFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var name: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .black
        temp.numberOfLines = 0
        temp.font = UIFont.boldSystemFont(ofSize: 15)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(name)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            image.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        name.text = data.name
        
        guard let urlString = data.image else { return }
        if let url = URL(string: urlString), (data.image != nil) {
            image.kf.setImage(with: url)
        }
    }
}

