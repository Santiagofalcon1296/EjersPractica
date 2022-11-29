//
//  DetailFilmsViewController.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
import UIKit
internal final class DetailFilmsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var detailFilmCollectionView: UICollectionView!
    
    var presenter: DetailFilmsPresenterProtocol?
    
    public convenience init(presenter: DetailFilmsPresenterProtocol){
        self.init(nibName: "DetailFilmsViewController", bundle: nil)
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailFilmCollectionView.dataSource = self
        detailFilmCollectionView.delegate = self
        
        detailFilmCollectionView.register(UINib(nibName: "CellDetailFilm", bundle: nil), forCellWithReuseIdentifier: "CellDetailFilm")
        self.presenter?.getDetailFilms()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getDetailFilmsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellDetailFilm", for: indexPath) as? CustomCellDetailFilm else {
            return CustomCellDetailFilm()
        }
        
        cell.detailFilmLabel.text = presenter?.deatilFilmsAtIndex(index: indexPath.row).name        
        return cell
    }
}

extension DetailFilmsViewController: DetailFilmsViewProtocol{
    func loadDetailFilms() {
        DispatchQueue.main.async {
            self.detailFilmCollectionView.reloadData()
        }
    }
}
