//
//  Service.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 2/6/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {

    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com/")
    static let sharedInstance = Service()

    func fetchHomeFeed(completion: @escaping (HomeDataSource) -> ()) {

        let request: APIRequest<HomeDataSource, JSONError> = tron.request("twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource)
        }) { (error) in
            print("Failed to fetch json", error)
        }

    }

    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }


}
