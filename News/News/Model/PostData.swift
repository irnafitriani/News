//
//  PostData.swift
//  News
//
//  Created by irna fitriani on 04/06/22.
//

import Foundation

// MARK: - Results
struct Results: Decodable {
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Decodable, Identifiable {
    var id: String? {
        return objectID
    }
    let title: String?
    let url: String?
    let points: Int?
    let objectID: String?
}
  
