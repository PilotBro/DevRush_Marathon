//
//  Artists.swift
//  SochiArtGallery
//
//  Created by Никита Грицунов on 18.07.2025.
//

struct Artists: Codable {
    let name: String
    let bio: String
    let image: Int
    let works: [Works]
}
