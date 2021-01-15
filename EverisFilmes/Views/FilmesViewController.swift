//
//  ViewController.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on var01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import AlamofireImage

class FilmesViewController: UITableViewController{
    
    var titulo: String?
    var posterPath:String?
    
    var viewModel: MainViewModel = MainViewModel()

    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.recebeFilme()
        tableView.reloadData()
        
    }
    
    //MARK: - Métodos
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewData.listeners.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmeTableViewCell
        
        let caminhoDaImagem: String
        caminhoDaImagem = self.posterPath ?? ""

         let imageUrl = URL(string: "https://image.tmdb.org/t/p/original\(caminhoDaImagem)")

        if let url = imageUrl {
            celula.imagemFilme?.af_setImage(withURL: url)
        }

        celula.labelTitulo.text = self.titulo



        return celula
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
//
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let filmes = viewModel.listaDeFilmes?.results[indexPath.row]
//        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "DetalhesFilmes") as! DetalhesFilmesViewController
//
//        controller.listaDeFilmes = filmes
//        self.navigationController?.pushViewController(controller,animated: true)
//    }
    
   
    @IBAction func buttonVerMais(_ sender: UIButton) {
        viewModel.paginaAtual = viewModel.paginaAtual + 1
        viewModel.recebeFilme()
        tableView.reloadData()
    }
    
    @IBAction func paginaAnterior(_ sender: Any) {
        
//        if paginaAtual >= 2 {
//        paginaAtual = paginaAtual - 1
//        viewDidLoad()
//        tableView.reloadData()
//        }
    }
}
        
    extension FilmesViewController: MainViewModelDelegate {
        
        func reloadData(movie: MovieViewData) {
            if movie.mediaType == "movie" {
                self.titulo = movie.originTitle
            } else {
                self.titulo = movie.originalName
            }
            
            self.posterPath = movie.posterPath
            
        }
    }

