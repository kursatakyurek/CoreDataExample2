//
//  CoreDataSetting.swift
//  CoreDataExample2Tekrar
//
//  Created by Kürşat Akyürek on 29.07.2023.
//

import CoreData
import UIKit

extension AddViewController{
    
    func CoreDataSetting(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entitySave = NSEntityDescription.insertNewObject(forEntityName: "OtomobilData", into: context)
        
        entitySave.setValue(markaTextField.text, forKey: "marka")
        entitySave.setValue(modelTextField.text, forKey: "model")
        entitySave.setValue(UUID(), forKey: "id")
        
        do{
            try context.save()
            alertMessage(title: "Başarılı", Message: "Veriler Kaydedildi")
            NotificationCenter.default.post(name: NSNotification.Name.init("CoreDataAdd"), object: nil)
        }catch{
            alertMessage(title: "Uyarı !", Message: "Veriler Kaydedilemedi")
        }
    }
    
    func alertMessage(title: String, Message: String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

