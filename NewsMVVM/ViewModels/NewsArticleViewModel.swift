//
//  NewsArticleViewModel.swift
//  NewsMVVM
//
//  Created by Fahad Bin Raza on 30/12/2022.
//

import Foundation


class ArticleListViewModel: NSObject {

    //MARK: - Properties
    private var articleList = [Articles]() {
        didSet{
            bindDataToView?(self.articleList)
        }
    }
    var bindDataToView: (([Articles]) -> ())?
    
    override init() {
        super.init()
        self.getNewsList()
    }
    
    func getNewsList(){
        Webservices.shared.getData() { response in
            if let newsList = response {
                self.articleList = newsList
            }
        }
    }
}
