//
//  MainViewModel.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 13/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate {
    func reloadData(movie: MovieViewData)
}

class MainViewModel : RespostaAPI{
    
    func success(Modelo: ModeloFilme) {
        listaDeFilmes = Modelo
        
        FilmesViewController().tableView.reloadData()
    }
    
    func failure() {
        print("deu ruim")
    }
    
    //MARK: - Properts
    var listaDeFilmes: ModeloFilme?
    var delegate: MainViewModelDelegate?
    var api =  FilmeAPI()
    var  paginaAtual = 1
    
    
    func recebeFilme(){
        api.configura(delegate: self)
        api.recuperaFilmes(pagina: paginaAtual)

    }
    
    
}
