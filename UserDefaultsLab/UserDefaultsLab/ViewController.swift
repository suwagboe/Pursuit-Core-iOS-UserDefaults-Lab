//
//  ViewController.swift
//  UserDefaultsLab
//
//  Created by Pursuit on 1/13/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 2 textFields
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var horoscopePicker: UIPickerView!
    
    var picker = [String]()
    var defaultHoroscope = "Virgo"
    
    var selectedPicker = Horoscope.virgo {
        didSet {
            
            
            
            UserSettings.shared.updateHoroscope(with: selectedPicker)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        picker = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
        
        horoscopePicker.delegate = self
        horoscopePicker.dataSource = self
       // setDefaultValue(item: Horoscope.virgo.rawValue)
        horoscopePicker.selectRow(6, inComponent: 0, animated: true)
    }
    
    func updateUI(){
        if let endingHoroscope = UserSettings.shared.whichHoroscope() {
            selectedPicker = endingHoroscope
        }
    }
    

}

extension ViewController: UIPickerViewDelegate {
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker[row]
    }
    
}

