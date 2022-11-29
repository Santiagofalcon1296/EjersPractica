//
//  FilmsViewController.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
import UIKit

internal final class FilmsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableViewFilms: UITableView!
    
    var presenter: FilmsPresenterProtocol?
    var delegate: FilmsCoordinatorDelegate?
    
    public convenience init (presenter: FilmsPresenterProtocol){
        self.init(nibName: "FilmsViewController", bundle: nil)
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFilms.dataSource = self
        tableViewFilms.delegate = self
        
        tableViewFilms.register(UINib(nibName: "CellsFilms", bundle: nil), forCellReuseIdentifier: "CellsFilms")
        presenter?.getFilms()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getFilmsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellsFilms", for: indexPath) as? CustomCellsFilms else {
            return CustomCellsFilms()
        }
        guard let currentCell = presenter?.filmsAtIndex(index: indexPath.row) else {
            return cell
        }
        cell.firstLabelFilm.text = currentCell.title
        cell.secondLabelFilm.text = currentCell.releaseDate
        cell.thirdLabelFilm.text = String(currentCell.episodeId)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let film = presenter?.filmsAtIndex(index: indexPath.row) else {
            return
        }
        delegate?.goToDetailScreen(film: film, sender: self)
    }
}

extension FilmsViewController: FilmsViewProtocol{
    func loadFilms() {
        DispatchQueue.main.async {
            self.tableViewFilms.reloadData()
        }
    }
}
