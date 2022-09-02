//
//  CharacterDetailContainerView.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import UIKit

class CharacterDetailContainerView: GenericBaseView<CharacterDetailData> {
    // MARK: Constants
    private let spacingValue: CGFloat = 10
    
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
        temp.contentMode = .scaleAspectFit
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var name: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .white
        temp.font = UIFont.boldSystemFont(ofSize: 21)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.dataSource = self
        temp.registerCell(cells: [ComicsCell.self])
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(tableView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            image.heightAnchor.constraint(equalToConstant: 250.0)
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
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CharacterDetailContainerView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = returnData() {
            let count = data.comics?.count ?? 0
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ComicsCell", for: indexPath) as? ComicsCell else { return BaseTableViewCell()}
        if let data = returnData() {
            guard let comics = data.comics else { return cell}
            let reversedComics: [ComicsResult] = comics.reversed()
            let item = reversedComics[indexPath.item]
            cell.setData(data: ComicsCellData(name: item.title))
            
        }
        return cell
    }
}

