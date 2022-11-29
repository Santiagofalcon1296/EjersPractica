//
//  StorageManager.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation

struct StoreManager {
    static let shared = StoreManager()

    func saveInfo(films: [FilmsSW]) {
        guard let infoObj = films as? [FilmsApi] else {
            return
        }
        do {

            let infoData = try JSONEncoder().encode(infoObj)

            let cachesDirectory = getCachesDirectory()
            let storageURL = cachesDirectory.appendingPathComponent("cacheResult.json",
                                                                       isDirectory: false)

            do {
                try infoData.write(to: storageURL)
            } catch let errorWrite {
                print(errorWrite.localizedDescription)
            }

        } catch let errorDescode {
            print(errorDescode.localizedDescription)
        }
    }

    func getFilms() -> [FilmsSW]? {
        let cachesDirectory = getCachesDirectory()
        let storageURL = cachesDirectory.appendingPathComponent("cacheResult.json",
                                                                   isDirectory: false)
        do{
            let infoData = try Data(contentsOf: storageURL)
            let films = try JSONDecoder().decode([FilmsApi].self, from: infoData)
            return films
        }catch
            let error {
            print(error.localizedDescription)
        }
        return []
    }

    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)

        return paths[0]
    }
}

