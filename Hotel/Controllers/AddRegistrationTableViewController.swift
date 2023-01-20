//
//  AddRegistrationTableViewController.swift
//  Hotel
//
//  Created by Arda Toprak on 20.01.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    // MARK: - UI Elements
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    
    // MARK: - Actions
    @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem){
        let firstname = firstNameTextField.text!
        let lastname = lastNameTextField.text!
        let email = emailTextField.text!
        
        print("Done Tapped")
        print("Firstname: \(firstname)")
        print("Lastname: \(lastname)")
        print("Email: \(email)")
    }
    
}
