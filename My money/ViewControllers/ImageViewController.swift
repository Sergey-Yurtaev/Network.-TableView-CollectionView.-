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
        
        DispatchQueue.global().async { // выводим в глобальный поток, что бы сразу переход а потом загрузка картики 
            guard let image = ImageManager.shared.fetchImage(from: URLExample.imageURL.rawValue) else { return }
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.imageView.image = UIImage(data: image)
            }
        }
    }
}
