//
//  PeopleApi.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
struct PeopleApi: PeopleSW, Codable{
    var name: String
    
    var height: String
    
    var mass: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case height
        case mass
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.height = try container.decode(String.self, forKey: .height)
        self.mass = try container.decode(String.self, forKey: .mass)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.height, forKey: .height)
        try container.encode(self.mass, forKey: .mass)
    }
}
