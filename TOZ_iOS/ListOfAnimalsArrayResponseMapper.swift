//
//  ListOfAnimalsArrayResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ListOfAnimalsArrayMapper: ArrayResponseMapper<ListOfAnimalsItem>, ResponseMapperProtocol {
    
    static func process(_ obj: AnyObject?) throws -> [ListOfAnimalsItem?] {
        return try process(obj, mapper: { jsonNode in
            guard let animalID = jsonNode?["id"] as? String? else { return nil }
            guard let type = jsonNode?["type"] as? String else { return nil }
            return ListOfAnimalsItem(animalID: animalID, type: type)
        })
    }
}

/*
 final class ArrayResponseMapper<A: ParsedItem> {
 
 static func process(_ obj: AnyObject?, mapper: ((Any?) throws -> A)) throws -> [A] {
 guard let json = obj as? [[String: AnyObject]] else { throw ResponseMapperError.invalid }
 
 var items = [A]()
 for jsonNode in json {
 let item = try mapper(jsonNode)
 items.append(item)
 }
 return items
 }
 }

 
 guard let id = jsonNode["id"] as? String? else { return nil }
 guard let type = jsonNode["type"] as? String else { return nil }
 return ListOfAnimalsItem(id: id, type: type)

*/
