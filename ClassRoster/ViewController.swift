//
//  ViewController.swift
//  ClassRoster
//
//  Created by Jung Kim on 2/19/15.
//  Copyright (c) 2015 JHK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var anotherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //array stuff
        var people = [Person]()
        let jung = Person(firstName: "Jung", lastName: "Kim")
        let jon = Person(firstName: "Jon", lastName: "Young")
        let greg = Person(firstName: "Greg", lastName: "Bowman")
        
        let coolPeople = [jung,jon,greg]
        for var i = 0; i < coolPeople.count; i++ {
            println(coolPeople[i].firstName)
        }
        
        
            

        //this is the long way to make an array
        //var morePeople = Array<Person>()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.view.backgroundColor = UIColor.redColor()
        
        println("view did load")
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        if let button = sender as? UIButton{
            button.backgroundColor = UIColor.whiteColor()
        }
//        self.view.backgroundColor = UIColor.blackColor()
    }

    @IBAction func switchToggle(sender: UISwitch) {
        if sender.on{
            self.view.backgroundColor = UIColor.purpleColor()
        }else{
            self.view.backgroundColor = UIColor.yellowColor()
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }

}

