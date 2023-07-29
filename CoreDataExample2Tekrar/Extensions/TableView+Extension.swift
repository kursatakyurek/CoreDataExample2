//
//  TableView+Extension.swift
//  CoreDataExample2Tekrar
//
//  Created by Kürşat Akyürek on 29.07.2023.
//

import UIKit
import CoreData

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        cell.markaLabel.text = dataArray1[indexPath.row]
        cell.modelLabel.text = dataArray2[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "addEdit") as! AddViewController
        vc.selectData = dataArray2[indexPath.row]
        vc.selectId = ids[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OtomobilData")
        let id = ids[indexPath.row].uuidString
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                if let _ = result.value(forKey: "id") as? UUID{
                    context.delete(result)
                    dataArray1.remove(at: indexPath.row)
                    dataArray2.remove(at: indexPath.row)
                    ids.remove(at: indexPath.row)
                    tableList.reloadData()
                    
                    do{
                        try context.save()
                    }catch{
                        print("Hata !, Silinemedi.")
                    }
                }
            }
        }catch{
            
        }
    }
}
