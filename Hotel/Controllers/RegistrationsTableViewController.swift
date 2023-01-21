//
//  RegistrationsTableViewController.swift
//  Hotel
//
//  Created by Arda Toprak on 21.01.2023.
//

import UIKit

class RegistrationsTableViewController: UITableViewController {

    // MARK: - UI Elements
    
    // MARK: - Properties
    var registrations = [Registration]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell")
        let registration = registrations[indexPath.row]
    }
    // MARK: -
    
}
