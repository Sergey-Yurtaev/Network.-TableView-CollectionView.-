//
//  MainCollectionViewController.swift
//  My money
//
//  Created by Sergey Yurtaev on 06.12.2021.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {

    private var exchanheRateses: ExchangeRates?
    private var arreyValuesRares: [DetailsRares] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            self.setNetwork()
        }

        navigationItem.title = "Exchange Rates"
        self.collectionView.register(UINib(nibName: "InfoCell", bundle: nil), forCellWithReuseIdentifier: "InfoCell")
    }
    
    private func setNetwork() {
        NetworkManagerAlamofire.shared.alamofireGet(from: UrlExample.currencyURL.rawValue) {
            money in
            self.exchanheRateses = money
            self.exchanheRateses?.valute?.forEach({ key, value in
                self.arreyValuesRares.append(value)
            })
            self.collectionView.reloadData()
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arreyValuesRares.count
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCell
        cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.7803811535, blue: 0.7319237963, alpha: 1)
        cell.layer.cornerRadius = 12
        
        let nameActive = arreyValuesRares[indexPath.row]
        cell.set(object: nameActive)
        
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
