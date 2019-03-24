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
        
    }

    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        //step 1: make networking request, by calling getRand... which initiates a web request
        // where we have access to that thing that we passed into our completion handler, person
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person {
                self.nameLbl.text = person.name
                self.heightLbl.text = person.height
                self.massLbl.text = person.mass
                self.hairLbl.text = person.hair
                self.birthLbl.text = person.birthYear
                self.genderLbl.text = person.gender
            }
        }
    }
    
}

