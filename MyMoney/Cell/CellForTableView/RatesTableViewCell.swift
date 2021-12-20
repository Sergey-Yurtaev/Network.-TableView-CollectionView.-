//
//  RatesTableViewCell.swift
//  My money
//
//  Created by Sergey Yurtaev on 14.12.2021.
//

import UIKit

class RatesTableViewCell: UITableViewCell {

    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceChange: UILabel!
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    func set(object: DetailsRares) {
        guard object.value != nil else { return }
        guard object.previous != nil else { return }
        
        if object.previous ?? 0 < object.value ?? 0 {
            self.emojiLabel.text = "↗️"
            self.priceChange.text =  String(format: "+ %.3f RUB", object.value! - object.previous!)
            self.priceChange.textColor = .systemGreen
            self.descriptionLabel.textColor = .systemGreen
        } else if object.previous ?? 0 > object.value ?? 0 {
            self.emojiLabel.text = "↘️"
            self.priceChange.text =  String(format: "- %.3f RUB", object.previous! - object.value!)
            self.priceChange.textColor = .systemRed
            self.descriptionLabel.textColor = .systemRed
        } else {
            self.emojiLabel.text = "🔄"
            self.priceChange.text =  String(format: " %.3f RUB", object.previous! - object.value!)
            self.priceChange.textColor = .black
            self.descriptionLabel.textColor = .black
        }
        self.titleLabel.text = "\(object.name ?? "No info")"
        self.descriptionLabel.text = "\(object.nominal ?? 0) \(object.charCode ?? "No info") = \(object.value ?? 0) RUB"
    }

}

