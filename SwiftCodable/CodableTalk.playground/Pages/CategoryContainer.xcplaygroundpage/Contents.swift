//: [Previous](@previous)

import Foundation

struct Category:Encodable {
    var id:String?
    var name:String?
    
    enum CodingKeys:String,CodingKey{
        case id = "category_id"
        case name = "category_name"
    }
    
    //EncodeFrom
    func encode(from encoder:Encoder){
        var container = encoder.container(keyedBy: CodingKeys.self)
         try! container.encode(id, forKey: .id)
           try! container.encode(name, forKey: .name)
        
    }
    //eContainer

    //iEncode
}

let category = Category(id: "234", name: "Hello")

let jsonEncoder = JSONEncoder()
let data = try? jsonEncoder.encode(category)
let dataInString = String(bytes: data!, encoding: .utf8)!

//: [Next](@next)
