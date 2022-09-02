//
//  ComicsCellContainerView.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import UIKit

class ComicsCellContainerView: GenericBaseView<ComicsCellData> {
    private lazy var name: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .systemBlue
        temp.textAlignment = .center
        temp.numberOfLines = 0
        temp.font = UIFont.boldSystemFont(ofSize: 19)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    override func addMajorViewComponents() {
        addSubview(name)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor),
            name.leadingAnchor.constraint(equalTo: leadingAnchor),
            name.trailingAnchor.constraint(equalTo: trailingAnchor),
            name.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        name.text = data.name
    }
}
