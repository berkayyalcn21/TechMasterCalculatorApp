//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Berkay on 10.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var calcButtons: [UIButton]!
    @IBOutlet var calcBigButtons: [UIButton]!
    @IBOutlet var calcOptionButtons: [UIButton]!
    @IBOutlet weak var labelSonuc: UILabel!
    var ilkSayi: String = ""
    var ikinciSayi: String = ""
    var islem: String = ""
    var sonucVarMi: Bool = false
    var sonuc: String = ""
    var ekstraSonuc: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonRadius()
        isEnableIslemler(enable: false)
    }
    
    func isEnableIslemler(enable: Bool) {
        for button in calcOptionButtons {
            button.isEnabled = enable
        }
    }
    
    func buttonRadius() {
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.width / 2
            button.layer.masksToBounds = true
        }
        
        for button in calcBigButtons {
            button.layer.cornerRadius = 15
            button.layer.masksToBounds = true
        }
    }
    
    @IBAction func butonBolme(_ sender: Any) {
        islem = "/"
    }
    
    @IBAction func butonCarpma(_ sender: Any) {
        islem = "x"
    }
    
    @IBAction func butonCikarma(_ sender: Any) {
        islem = "-"
    }
    
    @IBAction func butonToplama(_ sender: Any) {
        islem = "+"
    }
    
    @IBAction func butonEsittir(_ sender: Any) {
        sonuc = String(islemleriYap())
        let sonucArray = sonuc.components(separatedBy: ".")
        if sonucArray[1] == "0" {
            labelSonuc.text = sonucArray[0]
        }
        else {
            labelSonuc.text = sonuc
        }
        ekstraSonuc = ""
    }
    
    @IBAction func butonAc(_ sender: Any) {
        ilkSayi = ""
        ikinciSayi = ""
        islem = ""
        sonucVarMi = false
        sonuc = ""
        ekstraSonuc = ""
        labelSonuc.text = "0"
        isEnableIslemler(enable: false)
    }
    
    @IBAction func basilanNumaralar(_ sender: UIButton) {
            isEnableIslemler(enable: true)
            if islem == "" {
                ilkSayi += String(sender.tag)
                labelSonuc.text = ilkSayi
            }
            else if islem != "" && !sonucVarMi {
                ikinciSayi += String(sender.tag)
                labelSonuc.text = ikinciSayi
                isEnableIslemler(enable: false)
            }
            else if islem != "" && sonucVarMi {
                ekstraSonuc += String(sender.tag)
                labelSonuc.text = ekstraSonuc
            }
    }
    
    func islemleriYap() -> Double {
        if islem == "+" {
            if !sonucVarMi {
                sonucVarMi = true
                return Double(ilkSayi)! + Double(ikinciSayi)!
            }
            else {
                return Double(sonuc)! + Double(ekstraSonuc)!
            }
        }
        
        else if islem == "-" {
            if !sonucVarMi {
                sonucVarMi = true
                return Double(ilkSayi)! - Double(ikinciSayi)!
            }
            else {
                return Double(sonuc)! - Double(ekstraSonuc)!
            }
        }
        
        else if islem == "x" {
            if !sonucVarMi {
                sonucVarMi = true
                return Double(ilkSayi)! * Double(ikinciSayi)!
            }
            else {
                return Double(sonuc)! * Double(ekstraSonuc)!
            }
        }
        
        else if islem == "/" {
            if !sonucVarMi {
                sonucVarMi = true
                return Double(ilkSayi)! / Double(ikinciSayi)!
            }
            else {
                return Double(sonuc)! / Double(ekstraSonuc)!
            }
        }
        
        else {
            return Double(ilkSayi)!
        }
    }
    
}
