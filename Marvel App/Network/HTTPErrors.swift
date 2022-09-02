//
//  HTTPStatus.swift
//  NetworkLayer
//
//  Created by Mert Demirtaş on 31.08.2022.
//

import Foundation

enum HTTPErrors {
    case clientError
    case serverError
    
    init(statusCode: Int) {
        switch(statusCode) {
        case 400...499:
            self = .clientError
        case 500...599:
            self = .serverError
        default:
            self = .serverError
        }
    }
}
