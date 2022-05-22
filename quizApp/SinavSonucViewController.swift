//
//  SinavSonucViewController.swift
//  quizApp
//
//  Created by User on 21.05.2022.
//

import UIKit

class SinavSonucViewController: UIViewController {
    
    var gelenDogru = 0
    var gelenYanlis = 0
    var gelenPuan = 0
    var gelenSonucOgrenciNo:String?
    var gelenSonucDersKodu:String?
    
    @IBOutlet weak var lblDogruYanlis: UILabel!
    @IBOutlet weak var lblPuan: UILabel!
    @IBOutlet weak var imageEmoji: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sonucGetir()
        

        // Do any additional setup after loading the view.
    }
    
    func sonucGetir(){
        lblDogruYanlis.text = "\(gelenDogru) Doğru \(gelenYanlis) Yanlış"
        lblPuan.text = "Sınav Sonucu: \(gelenPuan) Puan"
        if gelenPuan == 100 {
            imageEmoji.image = UIImage(named: "yuz")
        }
        if gelenPuan >= 50 && gelenPuan < 100{
            imageEmoji.image = UIImage(named: "elliustu")
        }
        if gelenPuan >= 0 && gelenPuan < 50{
            imageEmoji.image = UIImage(named: "ellialti")
        }
    }
    
    @IBAction func Bitir(_ sender: Any) {
    }
    
    @IBAction func Sonuclar(_ sender: Any) {
    }
    
}
