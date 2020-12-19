//
//  ChapterController.swift
//  Dot98
//
//  Created by Jake Connerly on 12/18/20.
//

import Foundation
class ChapterController {
    
    var chapterOne: ChapterOne?
    
    func loadChapterOne(completion: @escaping (Result<ChapterOne, Error>) -> Void) {
        guard let chapterOnePath = Bundle.main.path(forResource: "chapter1", ofType: "json") else { return }
        let fileURL = URL(fileURLWithPath: chapterOnePath)
        
        URLSession.shared.dataTask(with: fileURL) { (data, _, error) in
            if let error = error {
                NSLog("Error loading chapters :\(error)")
                completion(.failure(error))
            }
            guard let data = data else {
                NSLog("No data returned: No decode")
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            do {
                let chapterOne = try JSONDecoder().decode(ChapterOne.self, from: data)
                completion(.success(chapterOne))
                self.chapterOne = chapterOne
            } catch {
                NSLog("Error decoding chapters:\(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
