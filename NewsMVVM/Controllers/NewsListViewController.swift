//
//  NewsListTableViewController.swift
//  NewsMVVM
//
//  Created by Fahad Bin Raza on 06/12/2022.
//

import UIKit

class NewsListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!

    var articleListViewModel: ArticleListViewModel?
    var newsList = [Articles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       SetUp()
       setupViewModel()
     
    }
    func SetUp(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.darkGray
        
        
        let titleAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = titleAttribute
        appearance.largeTitleTextAttributes = titleAttribute
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        tableViewOutlet.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
        func setupViewModel() {
            self.articleListViewModel = ArticleListViewModel()
            articleListViewModel?.bindDataToView = { [weak self] newsList in
                self?.newsList = newsList
                self?.updateUI()
            }
    }
        func updateUI() {
            DispatchQueue.main.async {
                self.tableViewOutlet.reloadData()
            }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newsList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let newsListCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            else { return UITableViewCell() }
            newsListCell.settingCells(articles: newsList[indexPath.row])
            return newsListCell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc1 = NewsDescriptionViewController()
        vc1.title = "News Description"
        vc1.url = newsList[indexPath.row].url
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    }

