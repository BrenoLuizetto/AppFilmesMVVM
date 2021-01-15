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
//        listaDeFilmes = Modelo
//        FilmesViewController().tableView.reloadData()
    }
    
    func failure() {
        print("deu ruim")
    }
    
    //MARK: - Properts
//    var listaDeFilmes: ModeloFilme?
    private let client: MovieServiceProtocol
    var viewData: Bindable<MovieViewData?> = Bindable(nil)
    var delegate: MainViewModelDelegate?
    var api =  FilmeAPI()
    var  paginaAtual = 1
    
    //MARK: - Constructors
    init(client: MovieServiceProtocol = FilmeAPI()) {
        self.client = client
    }
    
    func recebeFilme(){
        api.configura(delegate: self)
        api.recuperaFilmes(pagina: paginaAtual) { (Result) in
            self.delegate?.reloadData(movie: MovieViewData(model: Result))
        } failure: { (error) in
            print(error)
        }


    }
    
    
}
