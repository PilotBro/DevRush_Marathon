//
//  ArtGalleryJSONParser.swift
//  SochiArtGallery
//
//  Created by Никита Грицунов on 18.07.2025.
//
import Foundation

struct ArtGalleryJSONParser {
    
    private var artists = [Artist]()
    private let urlString = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
    
    private mutating func parseJSON() {
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
//                print(data)
                parse(json: data)
            }
        }
    }
    
    private mutating func parse(json: Data) {
        let decoder = JSONDecoder()
        print("Start Decoding JSON")
        if let jsonGallery = try? decoder.decode(Artists.self, from: json) {
            print("Decoded JSON")
            artists = jsonGallery.result
        } else {
            print("Error parsing JSON")
        }
    }
    
    mutating func getArtists() -> [Artist] {
        parseJSON()
        return artists
    }
    
                                        
}
