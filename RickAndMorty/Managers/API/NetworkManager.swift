//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Emir Alkal on 19.02.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}


