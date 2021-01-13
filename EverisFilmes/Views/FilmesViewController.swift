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
    
    var viewModel: MainViewModel = MainViewModel()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.recebeFilme()
        tableView.reloadData()

    }
    
    //MARK: - Métodos
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listaDeFilmes?.results.count ?? 0
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmeTableViewCell
        let filme = viewModel.listaDeFilmes?.results[indexPath.row]
        
        let titulo: String
        if  filme?.mediaType == "movie" {
            titulo = filme?.originalTitle ?? ""
        }else{
            titulo = filme?.originalName ?? ""
        }

        let caminhoDaImagem: String
        caminhoDaImagem = filme?.posterPath ?? ""

         let imageUrl = URL(string: "https://image.tmdb.org/t/p/original\(caminhoDaImagem)")

        if let url = imageUrl {
            celula.imagemFilme?.af_setImage(withURL: url)
        }
    
        celula.labelTitulo.text = titulo
        
        
        
        return celula
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmes = viewModel.listaDeFilmes?.results[indexPath.row]
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetalhesFilmes") as! DetalhesFilmesViewController
        
        controller.listaDeFilmes = filmes
        self.navigationController?.pushViewController(controller,animated: true)
    }
    
   
    @IBAction func buttonVerMais(_ sender: UIButton) {
        viewModel.paginaAtual = viewModel.paginaAtual + 1
        viewDidLoad()
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
