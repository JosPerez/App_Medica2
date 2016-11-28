//
//  File.swift
//  App_Medica
//
//  Created by alumno on 24/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import Foundation


class paciente :NSObject, NSCoding{
    
    //variable
    var nombre:String!
    var edad:Int!
    var sexo:String!
    var imagen:UIImage!
    //Doctor
    var nombreDoc:String!
    var cellNumber:String!
    var correoDoc:String!
    var especialidad:String!
    //Responsable
    var nombreResp:String!
    var RespCellNumber:String!
    var correoResp:String!
    
    init(nombre:String,edad:Int,sexo:String,imagen:UIImage,nombreDoc:String,cellNumber:String,correoDoc:String,especialidad:String,nombreResp:String,RespCellNumber:String!,correoResp:String) {
        
        self.nombre = nombre
        self.edad = edad
        self.sexo = sexo
        self.imagen = imagen
        //Doctor
        self.nombreDoc = nombreDoc
        self.cellNumber = cellNumber
        self.correoDoc = correoDoc
        self.especialidad = especialidad
        //Responsable
        self.nombreResp = nombreResp
        self.RespCellNumber = RespCellNumber
        self.correoResp = correoResp
        
    }
    override init() {
        self.nombre = nil
        self.edad = nil
        self.sexo = nil
        self.imagen = nil
        //Doctor
        self.nombreDoc = nil
        self.cellNumber = nil
        self.correoDoc = nil
        self.especialidad = nil
        //Responsable
        self.nombreResp = nil
        self.RespCellNumber = nil
        self.correoResp = nil
    }
    required convenience init(coder aDecoder: NSCoder) {
        let nom = aDecoder.decodeObject(forKey: "nombreP") as! String
        let Cant = aDecoder.decodeObject(forKey:"edad" ) as! Int
        let CantT = aDecoder.decodeObject(forKey: "sexo") as! String
        let TiAdm = aDecoder.decodeObject(forKey: "imgP") as! UIImage
        let HoraI = aDecoder.decodeObject(forKey: "nombreDoc") as! String
        let inter = aDecoder.decodeObject(forKey:"cellNumber") as! String
        let im = aDecoder.decodeObject(forKey: "correoDoc") as! String
        let com = aDecoder.decodeObject(forKey: "especialidad") as! String
        let dias = aDecoder.decodeObject(forKey: "nombreResp") as! String
        let respCel = aDecoder.decodeObject(forKey: "respCel") as! String
        let correoRes = aDecoder.decodeObject(forKey: "correoResp") as! String
        self.init(nombre:nom,edad:Cant,sexo:CantT,imagen:TiAdm,nombreDoc:HoraI,cellNumber:inter,correoDoc:im,especialidad:com,nombreResp:dias,RespCellNumber:respCel,correoResp:correoRes)
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre,forKey: "nombreP")
        aCoder.encode(edad,forKey:"edad" )
        aCoder.encode(sexo,forKey:"sexo" )
        aCoder.encode(imagen, forKey: "imgP")
        aCoder.encode(nombreDoc, forKey: "nombreDoc")
        aCoder.encode(cellNumber,forKey: "cellNumber")
        aCoder.encode(correoDoc,forKey:"correoDoc")
        aCoder.encode(especialidad,forKey: "especialidad")
        aCoder.encode(nombreResp,forKey: "nombreResp")
        aCoder.encode(RespCellNumber,forKey:"respCel")
        aCoder.encode(correoDoc,forKey: "correoResp")
    }
}
