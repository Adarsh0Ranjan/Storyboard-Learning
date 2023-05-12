//
//  DatePickerViewController.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 12/05/23.
//

import UIKit

class DatePickerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var DOB: UITextField!
    @IBOutlet weak var upcomingWeek: UITextField!
    @IBOutlet weak var last20yrs: UITextField!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Date Pickers"
        DOB.delegate = self
        upcomingWeek.delegate = self
        last20yrs.delegate = self
    }
    
    func createDatePicker(for textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        datePicker.preferredDatePickerStyle = .wheels
        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
        datePicker.datePickerMode = .date
        let calendar = Calendar.current
        let currentDate = Date()
        if textField == DOB {
            datePicker.maximumDate = currentDate
        } else if textField == upcomingWeek {
            let maximumDate = calendar.date(byAdding: .day, value: 7, to: currentDate)
            let minimumDate = calendar.date(byAdding: .day, value: 1, to: currentDate)
            datePicker.maximumDate = maximumDate
            datePicker.minimumDate = minimumDate
        } else if textField == last20yrs {
            let maximumDate = currentDate
            let minimumDate = calendar.date(byAdding: .year, value: -20, to: currentDate)
            datePicker.maximumDate = maximumDate
            datePicker.minimumDate = minimumDate
            datePicker.date = minimumDate!
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == DOB {
            createDatePicker(for: DOB)
        } else if textField == upcomingWeek {
            createDatePicker(for: upcomingWeek)
        } else {
            createDatePicker(for: last20yrs)
        }
    }
    
    @objc func donePressed(_ textField: UITextField) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        if DOB.isFirstResponder {
            DOB.text = formatter.string(from: datePicker.date)
            DOB.textAlignment = .center
        } else if upcomingWeek.isFirstResponder {
            upcomingWeek.text = formatter.string(from: datePicker.date)
            upcomingWeek.textAlignment = .center
        } else {
            last20yrs.text = formatter.string(from: datePicker.date)
            last20yrs.textAlignment = .center
        }
        self.view.endEditing(true)
    }
    
}
