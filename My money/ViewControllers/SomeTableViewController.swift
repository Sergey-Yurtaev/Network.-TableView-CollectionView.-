//
//  MainTableViewController.swift
//  My money
//
//  Created by Sergey Yurtaev on 02.12.2021.
//

import UIKit

class SomeTableViewController: UITableViewController {
    
    private var exchanheRateses: ExchangeRates?
    private var arreyValuesRares: [DetailsRares] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Exchange Rates"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        DispatchQueue.global().async {
            Networkmanager.shared.fetchData(from: URLExample.currencyURL.rawValue) {
                exchanheRateses in
                self.exchanheRateses = exchanheRateses
                self.exchanheRateses?.valute?.forEach({ key, value in
                self.arreyValuesRares.append(value)
                })
     
                self.tableView.reloadData()
            }
        }
    }
    
    // hide cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = "Data time \(exchanheRateses?.timestamp ?? "No info")"
        return section
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arreyValuesRares.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyCell", for: indexPath) as! RatesTableViewCell
        
        let object = arreyValuesRares[indexPath.row]
        cell.set(object: object)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete // значение по умолчанию удалить
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arreyValuesRares.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveRates = arreyValuesRares.remove(at: sourceIndexPath.row)
        arreyValuesRares.insert(moveRates, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}


