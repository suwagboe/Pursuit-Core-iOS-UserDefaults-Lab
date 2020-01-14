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
    
    @IBOutlet weak var moreInfoOutlet: UIButton!
    
    
    var zodiacSigns = [EnumHoroscope]()
   // var defaultHoroscope = "Virgo"
    
    var selectedZodiacSign = EnumHoroscope.virgo {
        didSet {
            
            // this is properly saving the
            UserSettings.shared.saveHoroscope(with: selectedZodiacSign)
            
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zodiacSigns = [EnumHoroscope.aries, EnumHoroscope.taurus, EnumHoroscope.gemini, EnumHoroscope.gemini, EnumHoroscope.leo, EnumHoroscope.virgo, EnumHoroscope.libra, EnumHoroscope.sagittarius, EnumHoroscope.scorpio, EnumHoroscope.capricorn, EnumHoroscope.aquarius, EnumHoroscope.pisces]
        
        //["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
        horoscopePicker.delegate = self
        horoscopePicker.dataSource = self
       // setDefaultValue(item: Horoscope.virgo.rawValue)
        
        
     
    }
    
    //button starter
    func buttonSetUp(){
        moreInfoOutlet.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? DetailsViewController else {
            fatalError("unable to segue to another view controller")
        }
        
        //let selected =
    }
    
    
    @IBAction func moreInfoButton(_ sender: UIButton) {
                
    }
    
    func updateUI(){
        if let endingHoroscope = UserSettings.shared.whichHoroscope() {
            // TODO: refactor to use index of picker
            // let sign = zodiacSigns[pickerIndex]
            // horoscopePicker.selectRow(pickerIndex, inComponent: 0, animated: true)
        }
    }

}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let sign = zodiacSigns[row]
        
        print(sign)
        
        selectedZodiacSign = sign
        
        print(row)
        
        // TODO: save row index to UserDefaults e.g row 3 - > Gemeni
        // zodiacSigns[3] -> Gemeni
        
    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return zodiacSigns.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return zodiacSigns[row].rawValue
    }
    
   // selectedRow
    
}

