//
//  ViewController2.swift
//  JSONPlace
//
//  Created by Jordi Milla on 25/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class ViewController2: UIViewController {

    let provider = MoyaProvider<JSONPlaceAPI>()
    var data: JSONPlace?
    
    @IBOutlet weak var labelTitle2: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestJSONById()
        
       
    }

    func upDateLabel(){
        
        //let str = "\( data?.id ?? 0)"
        labelTitle2.text = data?.title
    }
    
    func requestJSONById() {

        provider.request(.getJSONById(id: data?.id ?? 0)) { result in
            switch result {
            case .success(let response):
                print("success")
                let json = try! response.map(JSONPlace.self)
                self.data = json
                self.upDateLabel()
            case .failure:
                print("Error")
            }
        }
    }
}
