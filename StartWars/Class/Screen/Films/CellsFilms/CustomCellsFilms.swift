//
//  CustomCellsFilms.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
import UIKit

class CustomCellsFilms: UITableViewCell {
    
    @IBOutlet weak var firstLabelFilm: UILabel!
    @IBOutlet weak var secondLabelFilm: UILabel!
    @IBOutlet weak var thirdLabelFilm: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
