//
//  JSONPlace.swift
//  JSONPlace
//
//  Created by Jordi Milla on 25/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya

enum JSONPlaceAPI {
    
    case getJSONPlace
   // case getEmploById(id: String)
    
}

extension JSONPlaceAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL {  return URL(string: "https://jsonplaceholder.typicode.com/")!}
    
    public var path: String {
        switch self {
        case .getJSONPlace:
            return "todos"
            
        //case .getEmploById(id: let id):
        //    return "employee/\(id)"
            
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getJSONPlace:
            return .get
            
       // case .getEmploById(id: _):
          //  return .get
            
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getJSONPlace:
            return .bearer
            
       // case .getEmploById(id: _):
          //  return .bearer
            
        }
    }
    
    public var task: Task {
        switch self {
        case .getJSONPlace:
            return .requestPlain
            
       // case .getEmploById(id: _):
          //  return .requestPlain
            
        }
    }
    
    public var validationType: ValidationType {
        return .none
        
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
        
    }
    
    public var headers: [String: String]? {
        return nil
        
    }
}
