//
//  DetailsViewController.swift
//  UserDefaultsLab
//
//  Created by Pursuit on 1/13/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class moreInfoViewController: UIViewController {

  
    @IBOutlet weak var yournameLabel: UILabel!
    
    
    @IBOutlet weak var yourhoroscopeisLabel: UILabel!
    
    @IBOutlet weak var horosopeInformation: UITextView!
    
    
    
    var sign = UserSettings.shared.retrieveSelectedHoroscope() ?? EnumHoroscope(rawValue: "virgo")
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHoroscopeData()
        loadName()
        
    }
    
    func loadName(){
        
        yournameLabel.text = UserSettings.shared.retrieveSavedName()
        
        
        
        
    }
    
    
    // get the data from the link
    func getHoroscopeData(){
        HoroscopeAPICLient.fetchHoroscopes(with: sign!.rawValue, completion: {
            [weak self] result in
            switch result{
            case .failure(let appError):
                print("it dont work.\(appError)")
            case .success(let horoscopeData):
                // this is where the assignment of the labels should happen because we are getting the data.. success means I have horoscope data
                //self?.selectedZodiacSign = horoscopeData
                DispatchQueue.main.async {
                    // MARK: needs to be optional and needs self
                    self?.horosopeInformation.text = horoscopeData.horoscope
                    self?.yourhoroscopeisLabel.text = horoscopeData.sunsign
                }
            }
            
        })
    }

}
