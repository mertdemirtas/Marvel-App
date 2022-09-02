//
//  CharacterCellButtonView.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import UIKit

class CharacterCardButtonView: BaseButton<CharacterCardData> {
    // MARK: Constants
    private let spacingValue = 10.0
    
    // MARK: Components
    private lazy var characterCardContainerView: CharacterCardContainerView = {
        let temp = CharacterCardContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Lifecycle
    override func addMajorViewComponents() {
        containerView.addSubview(characterCardContainerView)
        
        NSLayoutConstraint.activate([
            characterCardContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            characterCardContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            characterCardContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            characterCardContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        characterCardContainerView.setData(by: data)
    }
}
