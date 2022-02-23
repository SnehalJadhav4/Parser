//
//  ViewController.swift
//  Parser
//
//  Created by mnameit on 16/02/22.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var parserTableView: UITableView!
    private let viewModel=ParserVieModel()
    
var tableArray=[Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.update = { [weak self] in
             self?.update()
           }
    }

    func update() {
        // update the UI based on the view model's state
        viewModel.parserArray.bind(listener: {[self] parserArrayObj in
            self.tableArray=parserArrayObj
            self.parserTableView.reloadData()
        })
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParserCell", for: indexPath) as! ParserCell
        let model = tableArray[indexPath.row] as! ParserModel
        cell.nameLabel.text=model.FirstName+" "+model.SurName
        cell.dobLabel.text=model.DOB
        cell.countLabel.text=model.count
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

