//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let data = """
{
    "category_id": "3",
    "category_name": "Nightlife"
}
""".data(using:.utf8)!

struct Category:Decodable {
    var id:String?
    var name:String?
    
    enum CodingKeys:String,CodingKey{
        case id = "category_id"
        case name = "category_name"
    }
    
    //initDec
    init(from decoder:Decoder) {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        id = try! container?.decode(String.self, forKey: .id)
        name = try! container?.decode(String.self, forKey: .name)
        
    }

        //dcontainer
      
        //did
       
      
}

let decoder = JSONDecoder()
let category = try? decoder.decode(Category.self, from: data)
//: [Next](@next)
