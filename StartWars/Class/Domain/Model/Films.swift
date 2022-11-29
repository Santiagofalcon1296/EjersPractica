//
//  Films.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
protocol FilmsSW {
    var title: String {get}
    var episodeId: Int {get}
    var releaseDate: String {get}
    var characters: [String] {get}
}
