//
//  Webservices.swift
//  NewsMVVM
//
//  Created by Fahad Bin Raza on 06/12/2022.
//

import Foundation


class Webservices{
    
    
    
    static let shared = Webservices()
    
   
    func getData(completion: @escaping ([Articles]?) -> ()){
        
        
        URLSession.shared.dataTask(with: Constants.url) { data, response, error in
            
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
