//
//  UIColor+Extension.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 1.09.2022.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

public extension UIColor {
    static let navBarColor: UIColor = UIColor(r: 240, g: 64, b: 74, alpha: 1)
    static let appBackgroundColor: UIColor = .black
    static let spinnerColor: UIColor = .white
    static let mainPageTableViewCellColor: UIColor = .clear
}
