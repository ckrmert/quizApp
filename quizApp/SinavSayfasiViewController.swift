//
//  SinavSayfasiViewController.swift
//  quizApp
//
//  Created by User on 20.05.2022.
//

import UIKit
import CoreData

class SinavSayfasiViewController: UIViewController {
    
    //var sorularArray = [DBSinavlarClass]()
    var sinavlarArray = [Sinavlar]()
    var filtreSinavlarArray = [Sinavlar]()
    var soruSayac = 1
    var toplamDogru = 0
    var toplamYanlis = 0
    var puan = 0
    var payda = 0
    var gelenDersKodu:String?
    var gelenOgrenciNo:String?
    //var ornekSinav = DBSinavlarClass(dersKodu: "mat155", soruId: 1, soruNe: "yirmi artı on", secenekA: "25", secenekB: "35", secenekC: "45", secenekD: "30", dogruSecenek: "D")
    
      
    @IBOutlet weak var lblDersKodu: UILabel!
    @IBOutlet weak var lblSoruSayisi: UILabel!
    @IBOutlet weak var lblSoruNe: UILabel!
    @IBOutlet weak var lblSecenekA: UILabel!
    @IBOutlet weak var lblSecenekB: UILabel!
    @IBOutlet weak var lblSecenekC: UILabel!
    @IBOutlet weak var lblSecenekD: UILabel!
    @IBOutlet weak var lblDogruSecenek: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veriyiCek()
        soruYukle()
        
       
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidenVeri = segue.destination as! SinavSonucViewController
        gidenVeri.gelenDogru = toplamDogru
        gidenVeri.gelenYanlis = toplamYanlis
        payda = 100 / (Int(toplamDogru) + Int(toplamYanlis))
        puan = Int(toplamDogru) * Int(payda)
        gidenVeri.gelenPuan = Int(toplamDogru) * Int(payda)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Sonuclar", into: context)
        
        saveData.setValue(gelenDersKodu!, forKey: "dersKodu")
        saveData.setValue(gelenOgrenciNo!, forKey: "ogrenciNo")
        saveData.setValue(puan, forKey: "puan")
        
        
        do{
            try context.save()
                print("BaşarılıSinav")
        }
            catch{
               print("Hata")
            }
        
    }
    
   
    func veriyiCek(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let talep:NSFetchRequest<Sinavlar> = Sinavlar.fetchRequest()
        
        do{
            sinavlarArray = try context.fetch(talep)
            for ix in 0...sinavlarArray.count-1{
                
                if sinavlarArray[ix].dersKodu == gelenDersKodu {
                    
                    filtreSinavlarArray.append(sinavlarArray[ix])
                }
                
            }
            
        }
            catch{
                print("Error")
            }
    }
    
    func soruYukle(){
        
        
        if soruSayac <= filtreSinavlarArray.count {
            lblDersKodu.text = filtreSinavlarArray[soruSayac-1].dersKodu
            lblSoruSayisi.text = "\(soruSayac) .Soru"
            lblSoruNe.text = filtreSinavlarArray[soruSayac-1].soruNe
            lblSecenekA.text = filtreSinavlarArray[soruSayac-1].secenekA
            lblSecenekB.text = filtreSinavlarArray[soruSayac-1].secenekB
            lblSecenekC.text = filtreSinavlarArray[soruSayac-1].secenekC
            lblSecenekD.text = filtreSinavlarArray[soruSayac-1].secenekD
            lblDogruSecenek.text = filtreSinavlarArray[soruSayac-1].dogruSecenek
        }
        
        else{
            
            performSegue(withIdentifier: "toSinavSonuc", sender: nil)
            
            
        }
        soruSayac+=1
    }
    
    func cevapVer(gelenCevap:String){
         
        if gelenCevap==lblDogruSecenek.text {
            toplamDogru += 1
        }
        else {
            toplamYanlis += 1
        }
    }
    

    @IBAction func aButton(_ sender: Any) {
        cevapVer(gelenCevap: "A")
        soruYukle()
        print(toplamDogru)
        print(toplamYanlis)
        
    }
    
    @IBAction func bButton(_ sender: Any) {
        cevapVer(gelenCevap: "B")
        soruYukle()
        print(toplamDogru)
        print(toplamYanlis)
    }
    
    
    @IBAction func buttonc(_ sender: Any) {
        cevapVer(gelenCevap: "C")
        soruYukle()
        print(toplamDogru)
        print(toplamYanlis)
    }
    
    
    @IBAction func buttond(_ sender: Any) {
        cevapVer(gelenCevap: "D")
        soruYukle()
        print(toplamDogru)
        print(toplamYanlis)
    }
    
    
    
   
    

}
