//
//  GenericResponse.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Alamofire
import Foundation
struct GenericResponse: Codable, Error {
    var success: Bool
    var message: String?
    var msg: String?
    var data: [String: [String]]?
    var status: Int
    var localizedDescription: String?
}
extension GenericResponse {
    init(_ description: String? = TextMessages.somethingWentWrong) {
        localizedDescription = description
        success = false
        status = -1
    }
    static func returnPseudoObj(msg: String = TextMessages.somethingWentWrong) -> GenericResponse {
        return GenericResponse(msg)
    }
}
struct TextMessages {
    static let somethingWentWrong = "Something went wrong"
}
