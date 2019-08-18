//
//  SinespService.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class SinespService {
    
    static let shared = SinespService()
    
    func search(plate: String, completion: @escaping ((Result<Vehicle, NSError>) -> Void)) {
        // prepare json data
        let json: [String: Any] = [
            "code": "20A84A42-0E0E-4603-8E4D-90F7711C0140",
            "placa": plate,
            "user": "dsdevelop",
            "senha": "meiaboca"
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        var request = URLRequest(url: URL(string: "https://server.dsdevelop.com.br/ws/wsrest/sinesp2")!)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            guard let vehicle = try? JSONDecoder().decode(Vehicle.self, from: data) else {
                completion(.failure(NSError.init(domain: "", code: 001, userInfo: nil)))
                return
            }
            
            completion(.success(vehicle))
            return
        }
        
        task.resume()
    }
    
}
