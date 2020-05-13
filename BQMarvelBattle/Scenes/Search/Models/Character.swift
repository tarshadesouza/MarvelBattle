//
//  Character.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 10/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import ObjectMapper

struct Character {
    var name: String = ""
    var description: String = ""
    var thumbnail: ThumbnailImage?
    var comics: Comics?
    var series: Series?
    var events: Events?
    var stories: Stories?
    var url: [Url]?
}

extension Character: Mappable {
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        description    <- map["description"]
        thumbnail    <- map["thumbnail"]
        comics    <- map["comics"]
        series    <- map["series"]
        events    <- map["events"]
        stories    <- map["stories"]
        url    <- map["urls"]
    }
}

struct Comics: Mappable, Equatable {
 
    var items: [ComicsSummary]?
    var available: Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        items    <- map["items"]
        available <- map["available"]
    }
    
    static func >(lhs: Comics, rhs: Comics) -> Bool {
        if lhs.items?.count ?? 0 > rhs.items?.count ?? 0 {
            return true
        } else {
            return false
        }
    }
    
    static func == (lhs: Comics, rhs: Comics) -> Bool {
        if lhs.items  == rhs.items {
            return true
        } else {
            return false
        }
    }
    
}

struct ComicsSummary: Mappable, Equatable  {
    var name: String?
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        name    <- map["name"]
    }
}

struct Series: Mappable {
    var items: [SeriesSummary]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        items    <- map["items"]
    }
}

struct SeriesSummary: Mappable {
    var name: String?
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        name    <- map["name"]
    }
}

struct Stories: Mappable {
    var items: [StoriesSummary]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        items    <- map["items"]
    }
}

struct StoriesSummary: Mappable {
    var name: String?
    var type: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        type    <- map["type"]
    }
}

struct Events: Mappable {
    var items: [EventsSummary]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        items    <- map["items"]
    }
}

struct EventsSummary: Mappable {
    var name: String?
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        name    <- map["name"]
    }
}

struct Url: Mappable {
    var url: String?
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        url    <- map["url"]
    }
}

struct ThumbnailImage {
    var path: String = ""
    var imageExtension: String = ""
    
    func fullPath() -> String {
        return "\(path).\(imageExtension)"
    }
}

extension ThumbnailImage: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        path    <- map["path"]
        imageExtension    <- map["extension"]
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        if lhs.name == rhs.name {
            return true
        } else {
            return false
        }
    }
}
