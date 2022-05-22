//
//  OgrenciDersKoduViewController.swift
//  quizApp
//
//  Created by User on 21.05.2022.
//

import UIKit

class OgrenciDersKoduViewController: UIViewController {
    
    
    @IBOutlet weak var txtDersKodu: UITextField!
    @IBOutlet weak var txtOgrenciNo: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidenVeri = segue.destination as! SinavSayfasiViewController
        gidenVeri.gelenDersKodu = txtDersKodu.text
        
        let gidenVerii = segue.destination as! SinavSayfasiViewController
        gidenVerii.gelenOgrenciNo = txtOgrenciNo.text
    }

}
