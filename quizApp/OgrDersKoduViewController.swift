//
//  OgrDersKoduViewController.swift
//  quizApp
//
//  Created by User on 20.05.2022.
//

import UIKit

class OgrDersKoduViewController: UIViewController {
    
    @IBOutlet weak var txtDersKodu: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidenVeri = segue.destination as! SoruHazirlaViewController
        gidenVeri.DersKodu = txtDersKodu.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
