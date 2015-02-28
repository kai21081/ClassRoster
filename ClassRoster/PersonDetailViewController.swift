//
//  PersonDetailViewController.swift
//  ClassRoster
//
//  Created by Jisoo Hong on 2015. 2. 26..
//  Copyright (c) 2015년 JHK. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = selectedPerson.firstName
        lastNameLabel.text = selectedPerson.lastName

        // Do any additional setup after loading the view.
    }

}
