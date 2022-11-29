//
//  FilmsApi.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
struct FilmsApi: FilmsSW, Codable {
    var title: String
    
    var episodeId: Int
    
    var releaseDate: String
    
    var characters: [String]
    
    enum CodingKeys: String , CodingKey {
        case title
        case episodeId = "episode_id"
        case releaseDate = "release_date"
        case characters
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.episodeId = try container.decode(Int.self, forKey: .episodeId)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.characters = try container.decode([String].self, forKey: .characters)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.title, forKey: .title)
        try container.encode(self.episodeId, forKey: .episodeId)
        try container.encode(self.releaseDate, forKey: .releaseDate)
        try container.encode(self.characters, forKey: .characters)
    }
}
