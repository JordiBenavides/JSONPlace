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
//                 let array: [Employees] = try! response.map(ResponseArrayAPI.self).data
//                self.data = array
//                self.tableView.reloadData()
            case .failure:
                print("Error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }

}

