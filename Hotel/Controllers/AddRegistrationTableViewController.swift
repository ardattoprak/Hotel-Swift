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
    
    @IBOutlet var checkInDatelabel:UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDatelabel:UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    // MARK: - Properties
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown = false {
        didSet {
            // isHidden: Bir arayüz elemanının görünürlüğünü söyler.
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown = false {
        didSet {
            // isHidden: Bir arayüz elemanının görünürlüğünü söyler.
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // CheckIn tarihini, bugünün gecesi olarak ayarlar.
        let midnightToday = Calendar.current.startOfDay(for: Date())
        
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday

    }
    
    // MARK: - Functions
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            if isCheckInDatePickerShown {
                return 216
            }else {
                return 0
            }
        case checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown {
                return 216
            }else {
                return 0
            }
        default:
            return 44
        }
    }
    func updateDateViews() {
        
        // 21/03/1996 --> .short --> 3:30 PM
        // 21/03/1996 --> .long --> March 21, 1996
        
        // date üzerine belirtilen miktarda saniye ekler.
        let oneDay: Double = 24 * 60 * 60
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(oneDay)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDatelabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDatelabel.text = dateFormatter.string(from: checkOutDatePicker.date)
        
        
    }
    
    // MARK: - Actions
    @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem){
        let firstname = firstNameTextField.text!
        let lastname = lastNameTextField.text!
        let email = emailTextField.text!
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        
        print("Done Tapped")
        print("Firstname: \(firstname)")
        print("Lastname: \(lastname)")
        print("Email: \(email)")
        print("CheckIn: \(checkInDate)")
        print("CheckOut: \(checkOutDate)")
    }
    
    @IBAction func datePickerValueChanged(_ picker: UIDatePicker){
        updateDateViews()
    }
    
}
