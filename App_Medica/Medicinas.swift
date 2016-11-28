//
//  Medicinas.swift
//  App_Medica
//
//  Created by alumno on 20/10/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit

class Medicinas: NSObject,NSCoding {

	
	var nombre:String!
	var CantidadCaja:Int!
	var CantidadToma:Int!
	var TipoAdimnistracion:String!
	var HoraInicio:NSDate!
	var intervalo:TimeInterval!
	var image:UIImage!
	var comentarios:String!
	var cantDias:Int!
	
	init(nombre:String,CantidadCaja:Int,CantidadToma:Int,TipoAdimnistracion:String,HoraInicio:NSDate,intervalo:TimeInterval,image:UIImage,comentarios:String,cantDias:Int){
		self.nombre = nombre
		self.CantidadCaja = CantidadCaja
		self.CantidadToma = CantidadToma
		self.TipoAdimnistracion = TipoAdimnistracion
		self.HoraInicio = HoraInicio
		self.intervalo = intervalo
		self.image = image
		self.comentarios = comentarios
		self.cantDias = cantDias
	}
	override init() {
		self.nombre = nil
		self.CantidadCaja = nil
		self.CantidadToma = nil
		self.TipoAdimnistracion = nil
		self.HoraInicio = nil
		self.intervalo = nil
		self.image = nil
		self.comentarios = nil
		self.cantDias = nil
	}
    required convenience init(coder aDecoder: NSCoder) {
        let nom = aDecoder.decodeObject(forKey: "nombre") as! String
        let Cant = aDecoder.decodeObject(forKey:"CantidadCaja" ) as! Int
        let CantT = aDecoder.decodeObject(forKey: "CantidadToma") as! Int
        let TiAdm = aDecoder.decodeObject(forKey: "TipoAdimnistracion") as! String
        let HoraI = aDecoder.decodeObject(forKey: "HoraInicio") as! NSDate
        let inter = aDecoder.decodeObject(forKey:"intervalo") as! TimeInterval
        let im = aDecoder.decodeObject(forKey: "image") as! UIImage
        let com = aDecoder.decodeObject(forKey: "comentarios") as! String
		let dias = aDecoder.decodeObject(forKey: "cantDias") as! Int
		self.init(nombre:nom,CantidadCaja:Cant,CantidadToma:CantT,TipoAdimnistracion:TiAdm,HoraInicio:HoraI,intervalo:inter,image:im,comentarios:com,cantDias:dias)
		
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre,forKey: "nombre")
        aCoder.encode(CantidadCaja,forKey:"CantidadCaja" )
        aCoder.encode(CantidadToma, forKey: "CantidadToma")
        aCoder.encode(TipoAdimnistracion, forKey: "TipoAdimnistracion")
        aCoder.encode(HoraInicio,forKey: "HoraInicio")
        aCoder.encode(intervalo,forKey:"intervalo")
        aCoder.encode(image,forKey: "image")
        aCoder.encode(comentarios,forKey: "comentarios")
		aCoder.encode(cantDias,forKey:"cantDias")
    }
	
}
