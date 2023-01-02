//
//  TableViewCell.swift
//  NewsMVVM
//
//  Created by Fahad Bin Raza on 30/12/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleNews: UILabel!
    
    @IBOutlet weak var descriptionNews: UILabel!
    
  
    func settingCells(articles: Articles){
        
        self.titleNews.text = articles.title
        self.descriptionNews.text = articles.description
    }
    
}
