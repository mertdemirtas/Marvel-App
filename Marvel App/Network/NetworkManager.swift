//
//  NetworkManager.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 16.04.2022.
//

import Alamofire
import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func clientError()
    func serverError()
}

class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    
    public func request<T: Codable>(from endPoint: Endpoint, completionHandler: @escaping (T) -> Void) {
        // MARK: URL
        let urlString = endPoint.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString ?? "")!
        var urlRequest = URLRequest(url: url)
        
        // MARK: HTTP Method
        urlRequest.httpMethod = endPoint.httpMethod.rawValue
        
        AF.request(urlRequest).responseDecodable(of: T.self) { [weak self] response in
            switch response.result {
            case .success(let data):
                completionHandler(data)
            case .failure(_):
                guard let statusCode = response.response?.statusCode else { return }
                let httpError = HTTPErrors.init(statusCode: statusCode)
                switch httpError {
                case .clientError:
                    self?.delegate?.clientError()
                case .serverError:
                    self?.delegate?.serverError()
                }
            }
        }
    }
}
