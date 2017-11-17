//
//  InputDataViewController.swift
//  PostTestHotelApps
//
//  Created by Abi Sayuti on 11/17/17.
//  Copyright © 2017 Abi Sayuti. All rights reserved.
//

import UIKit

class InputDataViewController: UIViewController {
    
    
    @IBOutlet weak var etName: UITextField!
    @IBOutlet weak var etAlamat: UITextField!
    @IBOutlet weak var etRate: UITextField!
    @IBOutlet weak var etFasilitas: UITextField!
    @IBOutlet weak var etLokasi: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnSave(_ sender: Any) {
        
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let namaHotel = Hotel(context: context)
        
        namaHotel.nama_hotel = etName.text //deklarasikan bahwa nameTask.name_task itu isinya dari etNametask.text
        
        namaHotel.alamat_hotel = etAlamat.text
        namaHotel.rate_hotel = etRate.text
        namaHotel.fasilitas_haotel = etFasilitas.text
        namaHotel.lokasi_terdekat_hotel = etLokasi.text
        
        
        
        if etName.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "This is Required", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //ketika kondisi tesk task nya tidak kosong
            //data di simpan ke core Data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            _ = navigationController?.popViewController(animated: true)
            
            //mencetak kalau data berhasil ditambahkan
            print("Data Has Been Saved")
        
        
        
        
    }
    
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
