//
//  SomeViewController.swift
//  My money
//
//  Created by Sergey Yurtaev on 02.12.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
        
        DispatchQueue.global().async {
            guard let image = NetworkManagerImageURLSession.shared.fetchImage(from: UrlExample.imageURL.rawValue) else { return }
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.imageView.image = UIImage(data: image)
            }
        }
    }
}
