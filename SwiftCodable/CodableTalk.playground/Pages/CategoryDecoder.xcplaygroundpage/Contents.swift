//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
//Let us see how decoding magic happens by implementing initWithDecoder
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
        //JSON is group of containers - it could be keyedContainer (Dictionary), unKeyedContainer(Array), or SingleValueContainer(String). Here we extract the topmost container having a category object
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        //Then decode from container giving object type and corresponding coding key. The compiler generates coding keys based on property names. But if you want to have customization, specify coding keys as well
        id = try! container?.decode(String.self, forKey: .id)
        name = try! container?.decode(String.self, forKey: .name)
        
    }
    
}

let decoder = JSONDecoder()
let category = try? decoder.decode(Category.self, from: data)
//: [Next](@next)
