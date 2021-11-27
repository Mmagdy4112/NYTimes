//
//  DataBaseHelper.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/27/21.
//

import GRDB

var dbQueue: DatabaseQueue!
class DataBaseHelper {
    static var shared = DataBaseHelper()
    static func setup(for application: UIApplication) throws {
        do {
        let databaseURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("database").appendingPathExtension("db")
        
        dbQueue = try DatabaseQueue(path: databaseURL.path)
        print("DataBase Path :" ,databaseURL.path)
        createTables()
        }catch(let error){
            print(error)
        }
    }
    
    static func createTables(){

        createDeliveryTypesTable()
    }
    
    static func createDeliveryTypesTable(){
        do {
            try dbQueue.write { db in
                try db.create(table: "items",ifNotExists: true) { t in
                    t.autoIncrementedPrimaryKey("id")
                    t.column("section", .text)
                    t.column("subsection", .text)
                    t.column("title", .text)
                    t.column("abstract", .text)
                    t.column("url", .text)
                    t.column("uri", .text)
                    t.column("byline", .text)
                    t.column("item_type", .text)
                    t.column("updated_date", .text)
                    t.column("created_date", .text)
                    t.column("published_date", .text)
                    t.column("material_type_facet", .text)
                    t.column("kicker", .text)
                    t.column("org_facet", .text)
                    t.column("per_facet", .text)
                    t.column("geo_facet", .text)
                    t.column("des_facet", .text)
                    t.column("multimedia", .text)
                    t.column("short_url", .text)
                    t.column("isFavourite", .boolean).defaults(to: false)

                }
            }
        }catch{
            print("DataBase protduct error",error)
        }
    }
}



