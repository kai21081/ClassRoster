//
//  PersonDetailViewController.swift
//  ClassRoster
//
//  Created by Jisoo Hong on 2015. 2. 26..
//  Copyright (c) 2015년 JHK. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var firstNameTextLabel: UITextField!
    @IBOutlet weak var lastNameTextLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextLabel.text = selectedPerson.firstName
        lastNameTextLabel.text = selectedPerson.lastName
        //imageView.image = selectedPerson.image?
        
        self.firstNameTextLabel.delegate = self;
        self.lastNameTextLabel.delegate = self;

        // Do any additional setup after loading the view.
    }
    @IBAction func photoButtonPressed(sender: AnyObject) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
             imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        }else{
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        selectedPerson.firstName = firstNameTextLabel.text
        selectedPerson.lastName = lastNameTextLabel.text
        selectedPerson.image = imageView.image
        
    }
    
    func textFieldShouldReturn(textField: UITextField)-> Bool{
        textField.resignFirstResponder()
        return true
    }

}
