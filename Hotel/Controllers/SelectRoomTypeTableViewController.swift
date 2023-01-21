//
//  SelectRoomTypeTableViewController.swift
//  Hotel
//
//  Created by Arda Toprak on 21.01.2023.
//

import UIKit

class SelectRoomTypeTableViewController: UITableViewController {
    // MARK: - UI Elements
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomType.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell")!
        let roomType = RoomType.all[indexPath.row]
        
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "₺ \(roomType.price)"
        
        return cell
    }
    
    
    // MARK: - Actions
}
