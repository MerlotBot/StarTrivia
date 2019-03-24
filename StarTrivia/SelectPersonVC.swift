//
//  ViewController.swift
//  StarTrivia
//
//  Created by Antonakakis Nikolaos on 24.03.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    // initialize an instance of our PersonAPI()
    var personApi = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //step 1: make networking request, by calling getRand... which initiates a web request
        // where we have access to that thing that we passed into our completion handler, person
        personApi.getRandomPersonUrlSession { (person) in
            if let person = person {
                print(person.name)
            }
        }
        //step 2: closure and completion handlers
    }


}

