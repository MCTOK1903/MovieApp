//
//  NetworkService.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    
    //MARK: - Properties
    public static let shared: NetworkService = NetworkService()
    
    private let apiKey = "fc6fbc3ee72d36c19e1752a6ee0f6273"
    
    private let movieUrl = "https://api.themoviedb.org/3/movie/top_rated"
    
}

//MARK: - public Functions

extension NetworkService {
    
     public func service<T:Codable>(_ method: HTTPMethod,
                                   url:String,
                                   model: T.Type,
                                   detailID:Int?,
                                   completion: @escaping(AFResult<Codable>) -> Void ) {
        
        
        AF.request(
            url,
            method:method,
            encoding: JSONEncoding.default
        ).validate()
            .responseJSON { (response) in
                
                switch response.result {
                case .success(let value as [String:AnyObject]):
                    do {
                        let responseJsonData = JSON(value)
                        let responseModel = try JSONDecoder().decode(model.self, from: responseJsonData.rawData())
                        completion(.success(responseModel))
                    }
                    catch let parsingError {
                        print("Success (error): \(parsingError)")
                    }
                case .failure(let error):
                    print("Failure: \(error)")
                    completion(.failure(error))
                    
                default: fatalError("Fatal Error")
                }
        }
        
    }
    
}
