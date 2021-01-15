//
//  MainViewData.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 13/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

protocol MovieViewDataType{
    var originTitle: String { get }
    var originalName: String { get }
    var overview: String { get }
    var posterPath: String { get }
    var mediaType: String { get }
    
}

import Foundation

class MovieViewData {
    
     private let model: Result
    init(model: Result){
        self.model = model
    }
    
}

extension MovieViewData: MovieViewDataType {
    var originTitle: String {
        return model.originalTitle ?? ""
    }
    
    var originalName: String {
        model.originalName ?? ""
    }
    
    var overview: String {
        return model.overview ?? ""
    }
    
    var posterPath: String {
        return model.posterPath ?? ""
    }
    
    var mediaType: String {
        return model.mediaType ?? ""
    }
    
  
}
