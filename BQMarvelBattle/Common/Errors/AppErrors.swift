//
//  AppErrors.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 14/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

protocol CustomErrorProtocol {
    var description: String { get }
    var title: String { get }
}

enum AppError: CustomErrorProtocol, Error {
    case dataParsingError(_ customDescription: String? = nil)
    case resourceLoadingError
    case genericError
    case notFoundError
    case noConnection
    case customError(description: String)
    
    var title: String {
        switch self {
        case .dataParsingError:
            return "Error with data"
        case .resourceLoadingError:
            return "Oops loading error"
        case .genericError:
            return "Oops something went wrong"
        case .notFoundError:
            return "Not Found"
        case .noConnection:
            return "No Connection"
        case .customError(let description):
            return description
        }
    }
    
    var description: String {
        switch self {
        case .dataParsingError:
            return "Data wasnt parsed correctly"
        case .resourceLoadingError:
            return "Resource wasnt able to load properly"
        case .genericError:
            return "Try again later"
        case .notFoundError:
            return "No character found with that name"
        case .noConnection:
            return "It seems you have no wifi connection try reconnect"
        case .customError(let description):
            return description
        }
    }
}
