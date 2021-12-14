//
//  MainCollectionViewController.swift
//  My money
//
//  Created by Sergey Yurtaev on 06.12.2021.
//

import UIKit

enum NameActive: String, CaseIterable {
    case dollar = "Dollar"
    case euro = "Euro"
}

class MainCollectionViewController: UICollectionViewController {
    
    let nameActive = NameActive.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        self.collectionView.register(UINib(nibName: "InfoCell", bundle: nil), forCellWithReuseIdentifier: "InfoCell")
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 0.5818923148, green: 0.6277064277, blue: 0.8549019694, alpha: 1)
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameActive.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCell
        cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        cell.layer.cornerRadius = 13
        
        let nameActive = nameActive[indexPath.item]
        cell.nameActiveLabel.text = nameActive.rawValue
        
        return cell
    }
    
    //    MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "description", sender: InfoCell.self)
    }
    
    //    // MARK: - Navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let detailsVC = segue.destination as! DescriptionViewController
    //    }
    
}

// MARK: - Delegate
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width - 32, height: 80)
    }
}
