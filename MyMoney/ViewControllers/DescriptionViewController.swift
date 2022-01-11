//
//  DescriptionViewController.swift
//  My money
//
//  Created by Sergey Yurtaev on 08.12.2021.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    
    var descriptionCurrent: String!
    let data = Date()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let formate = data.getFormattedDate(format: "yyyy-MM-dd HH:mm")
        descriptionLabel.text = "Data time: \(formate)"
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
 

