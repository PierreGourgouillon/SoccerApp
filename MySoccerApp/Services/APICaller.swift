//
//  APICaller.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 06/01/2022.
//

import Foundation

protocol APICaller {
    func call<T: Decodable>(_ urlRequest: URLRequest, decodedType: T)
}

class DefaultAPICaller: APICaller {


    func call<T>(_ urlRequest: URLRequest, decodedType: T) where T : Decodable {

    }
}
