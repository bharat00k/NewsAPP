//
//  ArticleModel.swift
//  ServiceMVVMDemo
//
//  Created by Bharat Khatke on 21/08/20.
//  Copyright © 2020 Bharat Khatke. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]?
}


struct Article: Decodable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}
