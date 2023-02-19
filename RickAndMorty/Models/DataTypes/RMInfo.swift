//
//  RMInfo.swift
//  RickAndMorty
//
//  Created by Emir Alkal on 19.02.2023.
//

import Foundation

struct RMInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
