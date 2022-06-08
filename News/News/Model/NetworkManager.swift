//
//  NetworkManager.swift
//  News
//
//  Created by irna fitriani on 04/06/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts: [Hit] = []
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        let result = try? decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self?.posts = result?.hits ?? []
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
