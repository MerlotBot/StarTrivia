//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Antonakakis Nikolaos on 24.03.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)

    }
  
}
