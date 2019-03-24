//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Antonakakis Nikolaos on 24.03.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import Foundation

class PersonAPI {
    
    func getRandomPersonUrlSession() {
        
        guard let url = URL(string: PERSON_URL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            
            // unwrap our data
            guard let data = data else { return }
            
            // turn it to something that we want to read
            do {
                // try to serialize our data to json
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                // cast our JSON into a dictionary
                guard let json = jsonAny as? [String: Any] else { return }
                print(json)
                
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
}
