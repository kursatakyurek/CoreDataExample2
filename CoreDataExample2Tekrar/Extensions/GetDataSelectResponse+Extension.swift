//
//  GetDataSelectResponse.swift
//  CoreDataExample2Tekrar
//
//  Created by Kürşat Akyürek on 29.07.2023.
//

import UIKit
import CoreData

extension AddViewController{
    
    func getDataSelectResponse(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OtomobilData")
        let id = selectId?.uuidString
        fetchRequest.predicate = NSPredicate(format: "id = %@", id!)
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                if let modelTextField = result.value(forKey: "model") as? String{
                    self.modelTextField.text = modelTextField
                }
                
                if let markaTextField = result.value(forKey: "marka") as? String{
                    self.markaTextField.text = markaTextField
                }
            }
        }catch{
            alertMessage(title: "Hata !", Message: "Veriler DÜZENLENEMEDİ")
        }
    }
    
}
