//
//  AddRegistrationTableViewController.swift
//  Hotel
//
//  Created by Arda Toprak on 20.01.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    
    // MARK: - UI Elements
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDatelabel:UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDatelabel:UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet var numberOfAdultsLabel: UILabel!
    @IBOutlet var numberOfChildrenLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    @IBOutlet var wifiSwitch: UISwitch!
    
    
    @IBOutlet var roomTypeLabel: UILabel!
    
    
    
    
    // MARK: - Properties
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
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
    
    var roomType: RoomType?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // CheckIn tarihini, bugünün gecesi olarak ayarlar.
        let midnightToday = Calendar.current.startOfDay(for: Date())
        
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        
        //Storyboard'da ayarladığımız geçici değerleri o anki değere eşitlemek için.
        updateNumberOfGuests()
        
        updateRoomType()
        
    }
    
    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
            let destination = segue.destination as? SelectRoomTypeTableViewController
            // gidicek sayfanın delegate ı bu sayfa olsun ki verileri buraya aktarabilsin.
            destination?.delegate = self
            // gideceğimiz sayfaya seçilmiş roomtype ı yollamalıyız ki diğer sayfada tikli olsun.
            destination?.selectedRoomType = roomType
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // tableview çiziliceğinde her hücre için tek tek çalışır
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Seçili hücrenin seçili olma durumunu ortadan kaldırır.
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case checkInDateLabelCellIndexPath:
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            // Değişkenlerdeki değişim ile, heigtForRow fonksiyonu tekrardan çalıştırılır.
            // Fakat yükseklik değişimi animasyon ile çalışır
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case checkOutDateLabelCellIndexPath:
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            
            // Değişkenlerdeki değişim ile, heigtForRow fonksiyonu tekrardan çalıştırılır.
            // Fakat yükseklik değişimi animasyon ile çalışır
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
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
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    
    // MARK: - Actions
    @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem){
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let email = emailTextField.text!
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        let roomChoice = roomType?.name ?? "Not Set"
        
        print("Done Tapped")
        print("Firstname: \(firstName)")
        print("Lastname: \(lastName)")
        print("Email: \(email)")
        print("CheckIn: \(checkInDate)")
        print("CheckOut: \(checkOutDate)")
        print("NumberOfAdults: \(numberOfAdults)")
        print("NumberOfChildren: \(numberOfChildren)")
        print("wifi: \(hasWifi)")
        print("roomChoise: \(roomChoice)")
    }
    
    @IBAction func datePickerValueChanged(_ picker: UIDatePicker){
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ stepper: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    
}

}
