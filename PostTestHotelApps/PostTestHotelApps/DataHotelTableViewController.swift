//
//  DataHotelTableViewController.swift
//  PostTestHotelApps
//
//  Created by Abi Sayuti on 11/17/17.
//  Copyright © 2017 Abi Sayuti. All rights reserved.
//

import UIKit

class DataHotelTableViewController: UITableViewController {
    
    var hotell : [Hotel] = [] //this data taked from entity name
    var nameSelected:String?
    var alamatSelected:String?
    var rateSelected:String?
    var fasilitasSelected:String?
    var lokasiSelected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hotell.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDaftar", for: indexPath) as! DatahHotelTableViewCell

        let dataTask = hotell[indexPath.row]

        if let myDataTask = dataTask.nama_hotel {
            cell.labelNAME.text = myDataTask
        }
        if let myDataTask1 = dataTask.alamat_hotel {
            cell.labelALAMAT.text = myDataTask1
        }
        if let myDataTask2 = dataTask.rate_hotel{
            cell.labelRATE.text = myDataTask2
        }
       

        
        
        
        
        
        return cell
    }
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            hotell = try context.fetch(Hotel.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = hotell[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                hotell = try context.fetch(Hotel.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data again
        tableView.reloadData()
   

}

override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    //mengecek data yang dikirim
    print("Row \(indexPath.row)selected")
    
    let dataTask = hotell[indexPath.row]
    //memasukan data ke variable namaSelected ke masing masing variable nya
    nameSelected = dataTask.nama_hotel
    alamatSelected = dataTask.alamat_hotel
    rateSelected = dataTask.rate_hotel
    fasilitasSelected = dataTask.fasilitas_haotel
    lokasiSelected = dataTask.lokasi_terdekat_hotel
    //memamnggil segue passDataDetail
    performSegue(withIdentifier: "passData", sender: self)
}
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //mengecek apakah segue nya ada atau  tidak
    if segue.identifier == "passData"{
        //kondisi ketika segue nya ada
        //mengirimkan data ke detailViewController
        let sendData = segue.destination as! DetailViewController
        sendData.passName = nameSelected
        sendData.passRate = rateSelected
        sendData.passAlamat = alamatSelected
        sendData.passFasilitas = fasilitasSelected
        sendData.passLokasi = lokasiSelected
    }
    
    
}
}
