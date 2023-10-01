//
//  Codables.swift
//  FetchApp
//
//  Created by yajurva shrotriya on 9/30/23.
//

// Model for loading JSON into correct codable objects
import Foundation


//Codable item structure
struct Item: Codable{
    let id, listId : Int?
    let name: String?
    
    //Coding keys to define names in json
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case listId = "listId"
            case name = "name"
        }
    
    //Init function for Decoder handle data errors
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            listId = try values.decodeIfPresent(Int.self, forKey: .listId)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }
    
}
