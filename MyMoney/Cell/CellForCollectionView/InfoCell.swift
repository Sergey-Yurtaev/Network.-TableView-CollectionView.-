//
//  InfoCell.swift
//  My money
//
//  Created by Sergey Yurtaev on 07.12.2021.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    @IBOutlet var nameActiveLabel: UILabel!
    
    @IBOutlet var priceChangeLabel: UILabel!
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var priceActiveLabel: UILabel!
    
    func set(object: DetailsRares) {
        guard object.value != nil else { return }
        guard object.previous != nil else { return }
        
        if object.previous ?? 0 < object.value ?? 0 {
            self.imageLabel.text = "↗️"
            self.priceChangeLabel.text =  String(format: "+ %.3f RUB", object.value! - object.previous!)
            self.priceActiveLabel.textColor = .systemGreen
            self.priceChangeLabel.textColor = .systemGreen
        } else if object.previous ?? 0 > object.value ?? 0 {
            self.imageLabel.text = "↘️"
            self.priceChangeLabel.text =  String(format: "- %.3f RUB", object.previous! - object.value!)
            self.priceActiveLabel.textColor = .systemRed
            self.priceChangeLabel.textColor = .systemRed
        } else {
            self.imageLabel.text = "🔄"
            self.priceChangeLabel.text =  String(format: " %.3f RUB", object.previous! - object.value!)
            self.priceActiveLabel.textColor = .black
            self.priceChangeLabel.textColor = .black
        }
        self.nameActiveLabel.text = "\(object.charCode ?? "No info")"
        self.priceActiveLabel.text = "\(object.nominal ?? 0) \(object.charCode ?? "No info") = \(object.value ?? 0) RUB"
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
}
