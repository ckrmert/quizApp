//
//  DBSinavlarClass.swift
//  quizApp
//
//  Created by User on 20.05.2022.
//

import Foundation

class DBSinavlarClass{
    
    var dersKodu:String?
    var soruId:Int64?
    var soruNe:String?
    var secenekA:String?
    var secenekB:String?
    var secenekC:String?
    var secenekD:String?
    var dogruSecenek:String?
    
    init(){
        
    }
    
    init(dersKodu:String,soruId:Int64,soruNe:String,secenekA:String,secenekB:String,secenekC:String,secenekD:String,dogruSecenek:String){
        
        self.dersKodu=dersKodu
        self.soruId=soruId
        self.soruNe=soruNe
        self.secenekA=secenekA
        self.secenekB=secenekB
        self.secenekC=secenekC
        self.secenekD=secenekD
        self.dogruSecenek=dogruSecenek
    }
    
    
}
