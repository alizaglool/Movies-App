//
//  ServiesAPI.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import Foundation

class MoviesInteractor {
    
    enum APIRouter {
        case popular
        case movie(id: Int)
        
        func url() -> String {
            switch self {
            case .popular:
                return "https://api.themoviedb.org/3/movie/popular?api_key=7e46a8a0da96a74a34ce736d275b6a82&language=en-US&page=1"
            case .movie(let id):
                return "https://api.themoviedb.org/3/movie/\(id)?api_key=7e46a8a0da96a74a34ce736d275b6a82&language=en-US"
            }
        }
    }
    
    func fetchDate<T: Decodable>(url: APIRouter, complation: @escaping (T?, Error?)-> Void){

        guard let URL = URL(string: url.url()) else{ return }
        let session = URLSession.shared
        let request = URLRequest(url: URL)

        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? " ")
                return
            }
            let decoder = JSONDecoder()
            do{
                let dateResponce = try? decoder.decode(T.self, from: data)
                complation(dateResponce, nil)
            }catch let jsonError{
                complation(nil, jsonError)
            }
        }
        task.resume()
    }
    
}
