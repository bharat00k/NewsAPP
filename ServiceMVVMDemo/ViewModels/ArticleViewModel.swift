//
//  ArticleViewModel.swift
//  ServiceMVVMDemo
//
//  Created by Bharat Khatke on 21/08/20.
//  Copyright © 2020 Bharat Khatke. All rights reserved.
//

import Foundation


// For Parent Article List

struct ArticleListViewModel {
    
     let articleList: [Article]
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articleList.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articleList[index]
        return ArticleViewModel(article)
    }
    
}


//For single Article Object

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        if let title = self.article.title {
            return title
        } else {
            return "No title"
        }
    }
    
    var description: String {
        if let description = self.article.description {
            return description
        } else {
            return "No description"
        }
    }
    
    var url: String {
        if let url = self.article.url {
            return url
        } else {
            return ""
        }
    }
    
    var imageName: String {
        
        if let imageName =  self.article.urlToImage {
            return imageName
        }else{
            return ""
        }
    }
}
