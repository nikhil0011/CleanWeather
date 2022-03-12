//
//  ListingAPIRouter.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation
import Alamofire
enum ListingAPIRouter: APIConfiguration {
    case forecast(location: String)
    var method: HTTPMethod {
        switch self {
        case .forecast: return .get
        }
    }
    var path: String {
        switch self {
        case .forecast(let location):
            return Endpoint.recipes + "&q=\(location)&days=7"
        }
    }
    var parameters: Parameters? {
        switch self {
        case .forecast:
            return nil
        }
    }
    var host: String {
        switch self {
        case .forecast:
            return BASEURL
        }
    }
   
}
