//
//  ViewController.swift
//  CoreDataExample2Tekrar
//
//  Created by Kürşat Akyürek on 29.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var dataArray1 = [String]()
    var dataArray2 = [String]()
    var ids = [UUID]()
    
    @IBOutlet weak var tableList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataResponse()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getDataResponse), name: NSNotification.Name("CoreDataAdd"), object: nil)
    }
    
}


