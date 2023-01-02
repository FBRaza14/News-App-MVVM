//
//  Webservices.swift
//  NewsMVVM
//
//  Created by Fahad Bin Raza on 06/12/2022.
//

import Foundation


class Webservices{
    
    
    
    static let shared = Webservices()
    
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=3350c4fd010e48948c2e9a5ae8793332")!
    func getData(completion: @escaping ([Articles]?) -> ()){
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data1 = data{
             
                let articleLst = try? JSONDecoder().decode(articlesList.self, from: data1)
           
                if let articles = articleLst {
                    completion(articles.articles )
                }
                
                
            }
            
            
        }.resume()
    }
    
    
    
}
