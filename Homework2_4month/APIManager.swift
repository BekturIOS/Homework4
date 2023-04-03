//
//  ApiManager.swift
//  SnapKitLesson2
//
//  Created by Бектур Каримов on 30/3/23.
//

//IOS





import Foundation

class APIManager {
    static let shared = APIManager()
    
    let urlString = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8a10cb9a44ed497196ccf0833200a4e9"

    
    func getData(complation: @escaping(Result<NewsData, Error>) -> Void){
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {return}
            
            
            do{
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                complation(.success(newsData))
            }catch{
                complation(.failure(error))
            }
        }
        task.resume()
    }
}
