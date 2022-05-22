//
//  SoruHazirlaViewController.swift
//  quizApp
//
//  Created by User on 20.05.2022.
//

import UIKit
import CoreData

class SoruHazirlaViewController: UIViewController {
    
    var DersKodu:String?
    var soruSayac=1
    
    @IBOutlet weak var lblSoruSayisi: UILabel!
    @IBOutlet weak var lblDersKodu: UILabel!
    @IBOutlet weak var txtSoruNe: UITextField!
    @IBOutlet weak var txtSecA: UITextField!
    @IBOutlet weak var txtSecB: UITextField!
    @IBOutlet weak var txtSecC: UITextField!
    @IBOutlet weak var txtSecD: UITextField!
    @IBOutlet weak var txtDogruSec: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDersKodu.text = DersKodu
        lblSoruSayisi.text = "\(String(soruSayac)) .Soru"
        
    }
    
    

    @IBAction func SiradakiSoru(_ sender: Any) {
            SoruyuKaydet()
            SayfayiTemizle()
    }
    

    func SayfayiTemizle(){
        soruSayac+=1
        txtSoruNe.text=""
        txtSecA.text=""
        txtSecB.text=""
        txtSecC.text=""
        txtSecD.text=""
        txtDogruSec.text=""
        lblSoruSayisi.text = "\(String(soruSayac)) .Soru"
        
    }
    
    func SoruyuKaydet(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Sinavlar", into: context)
        
        saveData.setValue(DersKodu!, forKey: "dersKodu")
        saveData.setValue(soruSayac, forKey: "soruId")
        saveData.setValue(txtSoruNe.text, forKey: "soruNe")
        saveData.setValue(txtSecA.text, forKey: "secenekA")
        saveData.setValue(txtSecB.text, forKey: "secenekB")
        saveData.setValue(txtSecC.text, forKey: "secenekC")
        saveData.setValue(txtSecD.text, forKey: "secenekD")
        saveData.setValue(txtDogruSec.text, forKey: "dogruSecenek")
        
        do{
            try context.save()
                print("Başarılı")
        }
            catch{
               print("Hata")
            }
        
 
    }

}
