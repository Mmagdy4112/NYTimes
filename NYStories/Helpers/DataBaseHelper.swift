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
                try db.create(table: "delivery_type",ifNotExists: true) { t in
                    t.autoIncrementedPrimaryKey("id")
                    t.column("name", .text)
                    t.column("display_name", .text)
                    t.column("pricelist_id", .integer)
                    t.column("pricelist_name", .text)
                    t.column("order_type", .text)
                    t.column("delivery_product_id", .integer)
                    t.column("delivery_amount", .double)
                    t.column("__last_update", .text)
                    t.column("sequence", .integer)
                    t.column("require_info", .integer)
                    t.column("category_id", .integer)
                    t.column("required_driver", .integer)
                    t.column("show_customer_info", .integer)

                }
            }
        }catch{
            print("DataBase protduct error",error)
        }
    }
}


