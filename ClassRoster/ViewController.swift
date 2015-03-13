//
//  ViewController.swift
//  ClassRoster
//
//  Created by Jung Kim on 2/19/15.
//  Copyright (c) 2015 JHK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var coolPeople = [Person]()
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Persistent data
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let count = userDefaults.objectForKey("launchCount") as? Int{
            let newCount = count + 1
            userDefaults.setObject(newCount, forKey: "launchCount")
        }else{
            //first launch
            let count = 1
            userDefaults.setObject(count, forKey: "launchCount")
        }
        userDefaults.synchronize() //force save
        let c = userDefaults.objectForKey("launchCount") as? Int
        println("launchCount \(c!)")
        
        
        self.loadFromArchive()
        if self.coolPeople.isEmpty { //if array loaded from archive is empty, load it from plist
            if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"){
                if let plistArray = NSArray(contentsOfFile: filePath){
                    for var i = 0; i < plistArray.count; i++ {
                        if let data = plistArray[i] as? NSDictionary{
                            let personFirstName = data["firstName"] as String
                            let personLastName = data["lastName"] as String
                            let person = Person(firstName: personFirstName, lastName: personLastName)
                            coolPeople.append(person)
                        }
                    }
                }
            }
            self.saveToArchive()
        }

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func loadFromArchive(){
        let path = getDocumentsPath()
        let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/archive") as [Person]
        coolPeople = arrayFromArchive
    }
    
    func saveToArchive(){
        let path = self.getDocumentsPath()
        NSKeyedArchiver.archiveRootObject(coolPeople, toFile: path + "/archive")
    }
    
    func getDocumentsPath() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.UserDomainMask, true)
        let path = paths.first as String
        return path
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowGreen"{
            let destinationVC = segue.destinationViewController as PersonDetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            let person = coolPeople[indexPath!.row]
            destinationVC.selectedPerson = person
        }
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        self.saveToArchive()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
        let personToDisplay = coolPeople[indexPath.row]

        cell.personLabel.text = personToDisplay.firstName
        
        if personToDisplay.image != nil{
            cell.personImageView.image = personToDisplay.image
        }else{
            cell.personImageView.image = UIImage(named:"seahawkslogo.png")
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coolPeople.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      
    }

}

