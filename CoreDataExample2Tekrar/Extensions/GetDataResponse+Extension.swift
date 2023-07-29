//
//  GetDataResponse+Extension.swift
//  CoreDataExample2Tekrar
//
//  Created by Kürşat Akyürek on 29.07.2023.
//

import Foundation
import UIKit
import CoreData

extension MainViewController{
    
    @objc func getDataResponse(){
        
        dataArray1.removeAll()
        dataArray2.removeAll()
        ids.removeAll()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OtomobilData")
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                
                if let markaLabel = result.value(forKey: "marka") as? String{
                    self.dataArray1.append(markaLabel)
                    
                }
                if let modelLabel = result.value(forKey: "model") as? String{
                    self.dataArray2.append(modelLabel)
                }
                if let uid = result.value(forKey: "id") as? UUID{
                    self.ids.append(uid)
                }
            }
            
            tableList.reloadData()
            
        }catch{
            print("Hata")
        }
    }
}
