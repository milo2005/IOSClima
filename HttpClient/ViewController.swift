//
//  ViewController.swift
//  HttpClient
//
//  Created by Aplimovil on 4/05/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pres: UILabel!
    @IBOutlet weak var hum: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var des: UILabel!
    
    var api:ClimaApi!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api =  ClimaApi()
        api.getClima { (clima) in
            self.des.text = clima.text
            self.temp.text = clima.temp
            self.pres.text = clima.pres
            self.hum.text = clima.hum
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

