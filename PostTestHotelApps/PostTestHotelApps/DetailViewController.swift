//
//  DetailViewController.swift
//  PostTestHotelApps
//
//  Created by Abi Sayuti on 11/17/17.
//  Copyright © 2017 Abi Sayuti. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var labelnamaHotel: UILabel!
    @IBOutlet weak var labelAlamat: UILabel!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelFasilitas: UILabel!
    @IBOutlet weak var labelLokasi: UILabel!
    
    var passName:String?
    var passAlamat:String?
    var passRate:String?
    var passFasilitas:String?
    var passLokasi:String?
    override func viewDidLoad() {
        
        labelnamaHotel.text = "name of hotel is " + passName!
        labelAlamat.text = "the address is " + passAlamat!
        labelRate.text = "the rate is " + passRate!
        labelFasilitas.text = "Fasilitas is " + passFasilitas!
        labelLokasi.text = "lokasi is " + passLokasi!
        
        
        
         super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
