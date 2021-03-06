//
//  SelectCityViewController.swift
//  Find_Cafe
//
//  Created by Sean on 2016/12/29.
//  Copyright © 2016年 Chien Hsiang Yin. All rights reserved.
//

import UIKit

class SelectCityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseCityToSearch(sender: UIButton!) {
        
        guard let city = sender.currentTitle else {
            print("Failed to get city")
            return
        }
        
        let alert = UIAlertController(title: "You select \(city) city", message: "Are you sure?", preferredStyle: .alert)
        let doAction = UIAlertAction(title: "Yes", style: .default) { action in
            self.performSegue(withIdentifier: "chooseCityToSearch", sender: sender)
        }
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(doAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var city = ""
        
        if (segue.identifier == "chooseCityToSearch") {
            
            let navigationController = segue.destination as! UINavigationController
            let viewController = navigationController.topViewController as! CafesViewController
            switch (sender as! UIButton).currentTitle! {
            case "Taipei":
                city = "台北"
            case "Hsinchu":
                city = "新竹"
            case "Taichung":
                city = "台中"
            case "Tainan":
                city = "台南"
            case "Kaohsiung":
                city = "高雄"
            default:
                city = "台北"
            }
            viewController.newCity = city
        }
    }
}
