//
//  ListingAPIRouter.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation
import Alamofire
enum ListingAPIRouter: APIConfiguration {
    case forecast
    var method: HTTPMethod {
        switch self {
        case .forecast: return .get
        }
    }
    var path: String {
        switch self {
        case .forecast:
            return Endpoint.recipes
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
