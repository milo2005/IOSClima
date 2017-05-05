//
//  ClimaApi.swift
//  HttpClient
//
//  Created by Aplimovil on 4/05/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import Foundation
import Alamofire

class ClimaApi{
    
    let url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22medellin%2C%20co%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
    
    func getClima(callback:@escaping (Clima)->Void){
        
        //let body:[String:Any] = ["nombre":"Dario", "Usuario":"Dar", "edad":27]
        //Alamofire.request(url, method: .get, parameters:body)
        
        Alamofire.request(url, method:.get).responseJSON { (response) in
            
            let json = response.result.value as! [String:Any]
            let clima = Clima()
            
            let query = json["query"] as! [String:Any]
            let results = query["results"] as! [String:Any]
            let channel = results["channel"] as! [String:Any]
            let atmosphere = channel["atmosphere"] as! [String:Any]
            
            clima.hum = atmosphere["humidity"] as! String
            clima.pres = atmosphere["pressure"] as! String
            
            let item = channel["item"] as! [String:Any]
            let condition = item["condition"] as! [String:Any]
            
            clima.text = condition["text"] as! String
            clima.temp = condition["temp"] as! String
            
            callback(clima)
            
            
        }
        
    }
    
}
