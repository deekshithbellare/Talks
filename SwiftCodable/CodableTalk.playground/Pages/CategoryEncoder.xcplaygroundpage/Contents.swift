//: [Previous](@previous)

import Foundation
//Here we check how to encode Category into JSON
struct Category:Encodable {
    var id:String?
    var name:String?
    
    enum CodingKeys:String,CodingKey{
        case id = "category_id"
        case name = "category_name"
    }
    
    func encode(from encoder:Encoder){
        //Create a container
        var container = encoder.container(keyedBy: CodingKeys.self)
        //add objects into it using key
        try! container.encode(id, forKey: .id)
        try! container.encode(name, forKey: .name)
         //You can also add  child container if required
        
    }
}
let category = Category(id: "234", name: "Hello")

let jsonEncoder = JSONEncoder()
//Encode the cateogory object
let data = try? jsonEncoder.encode(category)
let dataInString = String(bytes: data!, encoding: .utf8)!

//: [Next](@next)
