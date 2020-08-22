//
//  NewsTableViewController.swift
//  ServiceMVVMDemo
//
//  Created by Bharat Khatke on 21/08/20.
//  Copyright © 2020 Bharat Khatke. All rights reserved.
//

import Foundation
import UIKit


class NewsTableViewController: UITableViewController {
    
    var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    //Set Up my view data
    func setUpView() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Call Webservice to get article data
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=e16cb6fff7d04dc3bc483dd6a8c28bc5") else {
            return
        }
        
        WebService().getNewsArticle(url: url) { (data) in
            
            if let data = data {
                self.articleListVM = ArticleListViewModel(articleList: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return (self.articleListVM == nil) ? 0 : self.articleListVM.numberOfSections
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? ArticleCell else {
             fatalError("Not a correct cell")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLbl.text = articleVM.title
        cell.descriptionLbl.text = articleVM.description
        cell.newImgView.isHidden = false
        guard let imageURL = URL(string: articleVM.imageName) else {
            cell.newImgView.isHidden = true
            fatalError("No image path found")
        }
        
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data(contentsOf: imageURL)
                DispatchQueue.main.async {
                    cell.newImgView.image = UIImage(data: data)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
       performSegue(withIdentifier: "webViewSegue", sender: articleVM)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "webViewSegue" {
            let vc = segue.destination as! DetailViewController
            vc.articleModel = sender as? ArticleViewModel
        }
    }
    
}
