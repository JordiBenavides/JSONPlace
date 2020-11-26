//
//  ViewController.swift
//  JSONPlace
//
//  Created by Jordi Milla on 25/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let provider = MoyaProvider<JSONPlaceAPI>()
    var data: [JSONPlace]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestJSONPlace()
        setTable()
    }

    func setTable(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
    }
    
    func requestJSONPlace(){
        
        provider.request(.getJSONPlace) { result in
            switch result {
            case .success(let response):
                print("success")
                let array = try! response.map([JSONPlace].self)
                 self.data = array
                 self.tableView.reloadData()
            case .failure:
                print("Error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        let jsonplace = data?[indexPath.row]
        cell?.configure(jsonplace: jsonplace)
        
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 else { return }
        vc.data = data?[indexPath.row]
            navigationController?.pushViewController(vc,
                                               animated: true)
        
    }
}

