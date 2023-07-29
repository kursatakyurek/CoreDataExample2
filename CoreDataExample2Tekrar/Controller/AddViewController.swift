//
//  AddViewController.swift
//  CoreDataExample2Tekrar
//
//  Created by Kürşat Akyürek on 29.07.2023.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var markaTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var tapped: UIButton!
    
    var selectData = ""
    var selectId: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectData != ""{
            titleLabel.text = "Otomobil Modelini Düzenle"
            tapped.setTitle("Düzenle", for: .normal)
            getDataSelectResponse()
        }else{
            
        }
        
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        
        if markaTextField.text != "" && modelTextField.text != ""{
            CoreDataSetting()
        }else{
            alertMessage(title: "Uyarı !", Message: "Alanlar Boş Geçilemez")
        }
        
    }
    
}
