//
//  RMGetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Emir Alkal on 19.02.2023.
//

import Foundation

struct RMGetCharactersResponse: Codable {
    let info: RMInfo
    let results: [RMCharacter]
}
