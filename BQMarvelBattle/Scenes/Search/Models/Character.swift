//
//  Character.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 10/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

struct Character {
    var name: String
    var comics: Comics
    var series: Series
    var events: Events
    var stories: Stories
    var url: [Url]
//    var sectionType: CharacterInfoType
    
    init(result: [String:AnyObject]) {
        self.name = result["name"] as! String
        self.comics = result["comics"] as! Comics
        self.series = result["series"] as! Series
        self.events = result["events"] as! Events
        self.stories = result["stories"] as! Stories
        self.url = result["urls"] as! [Url]

    }
}

struct Comics {
    var items: [ComicsSummary]
    
    init(items: [ComicsSummary]) {
        self.items = items
    }
}

struct ComicsSummary {
    var name: String?
    
    init(name: String) {
         self.name = name
     }
}

struct Series {
    var items: [SeriesSummary]
}

struct SeriesSummary {
    var name: String?
}

struct Stories {
    var items: [StoriesSummary]
}

struct StoriesSummary {
    var name: String?
    var type: String?
}

struct Events {
    var items: [EventsSummary]
}

struct EventsSummary {
    var name: String?
}

struct Url {
    var url: String?
}
