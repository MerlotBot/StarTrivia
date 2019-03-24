//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Antonakakis Nikolaos on 24.03.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    // Web Request with Alamofire
    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let json = response.result.value as? [String: Any] else { return completion(nil)}
            let person = self.parsePersonManual(json: json)
            completion(person)
        }
    }
    
//    // Web Request with URL Session
//    func getRandomPersonUrlSession(id: Int, completion: @escaping PersonResponseCompletion) {
//        
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//        // run a web request
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            
//            guard error == nil else {
//                debugPrint(error.debugDescription)
//                completion(nil)
//                return
//            }
//            
//            // get back the data
//            guard let data = data else { return }
//            
//            // turn it to something that we want to read, i.e parsing the data
//            do {
//                // try to serialize our data to json
//                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
//                // cast our JSON into a dictionary
//                guard let json = jsonAny as? [String: Any] else { return }
//                let person = self.parsePersonManual(json: json)
//                // when all the above is done, we finally say completion and it is when it escapes the function and goes to our SelectPersonVC
//                DispatchQueue.main.async {
//                    completion(person)
//                }
//                
//            } catch {
//                debugPrint(error.localizedDescription)
//                return
//            }
//        }
//        task.resume()
//    }
    
    // parse it into an object, a person structure
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeWorldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeWorldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
        
    }
}
