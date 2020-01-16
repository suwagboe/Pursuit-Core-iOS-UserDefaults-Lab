//
//  ViewController.swift
//  UserDefaultsLab
//
//  Created by Pursuit on 1/13/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // 2 textFields
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var updateInfoOutlet: UIButton!
    
    // empty integer
   // var indexHolder: Int?
    
    var zodiacSigns = [EnumHoroscope]() // empty array of signs
    
    
    var checkIfPickerMoved : String? {
        didSet {
            updateInfoOutlet.isEnabled = true
        }
    }
    
    var selectedZodiacSign = EnumHoroscope.virgo  {
        didSet {
            // this is properly saving the
            UserSettings.shared.saveHoroscope(with: selectedZodiacSign)
        }
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetUp() // the setup for the button when everything is loaded
        // populates the data into the pickerView
        zodiacSigns = [EnumHoroscope.aries, EnumHoroscope.taurus, EnumHoroscope.gemini, EnumHoroscope.cancer, EnumHoroscope.leo, EnumHoroscope.virgo, EnumHoroscope.libra, EnumHoroscope.sagittarius, EnumHoroscope.scorpio, EnumHoroscope.capricorn, EnumHoroscope.aquarius, EnumHoroscope.pisces]
        
        //["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
        
        textField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
       // setDefaultValue(item: Horoscope.virgo.rawValue)
        }
    
    //button starter
    func buttonSetUp(){
        updateInfoOutlet.isHidden = true
        updateInfoOutlet.isEnabled = false
    }
    
    

    
    @IBAction func updateInfoButton(_ sender: UIButton) {
       
       // do i need a unwind segue
        
//        guard let destination = segue.source as? moreInfoViewController else {
//            return
//        }
        
        if textField.text!.isEmpty {
            updateInfoOutlet.isEnabled = true
        }
        
    }

}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let sign = zodiacSigns[row]
        
        print(sign)
        
        updateInfoOutlet.tintColor = .blue
        updateInfoOutlet.isEnabled = true
        
        checkIfPickerMoved = "Itmoved"

        selectedZodiacSign = sign
              
    }
    
}
extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return zodiacSigns.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return zodiacSigns[row].rawValue
    }
}
extension SettingsViewController: UITextFieldDelegate {
    // once they press enter the name is persisted..
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.resignFirstResponder() {
        // basically if they are done typing then the text that was typed should be saved
             UserSettings.shared.saveTheName(with: textField.text ?? "please enter a name")
            print("saved")
           
            updateInfoOutlet.isHidden = false
            updateInfoOutlet.tintColor = .red
         }
        return true
    }
}

