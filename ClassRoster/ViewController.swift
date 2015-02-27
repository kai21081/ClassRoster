//
//  ViewController.swift
//  ClassRoster
//
//  Created by Jung Kim on 2/19/15.
//  Copyright (c) 2015 JHK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var coolPeople = [Person]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //array stuff
        var people = [Person]()
        let jung = Person(firstName: "Jung", lastName: "Kim")
        let jon = Person(firstName: "Jon", lastName: "Young")
        let greg = Person(firstName: "Greg", lastName: "Bowman")
        let jisoo = Person(firstName: "Jisoo", lastName: "Hong")
        let chu = Person(firstName: "Chu", lastName: "Kim")
        
        coolPeople = [jung,jon,greg,jisoo,chu]
        

        self.tableView.dataSource = self
        
        
        self.view.backgroundColor = UIColor.redColor()
        
        println("view did load")
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        //cell.backgroundColor = UIColor.blueColor()
        cell.textLabel?.text = coolPeople[indexPath.row].firstName
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coolPeople.count
    }

}

