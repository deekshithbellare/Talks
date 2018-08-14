//: [Previous](@previous)

import Foundation
var str = "Hello, playground"

let data = """
{
    "id": "3",
    "name": "Nightlife"
}
""".data(using:.utf8)!
//what is we have a property that's not part of JSON parsing?
struct Category:Decodable {
    var id:String?
    var name:String?
    
    //catCodingKey
    enum CodingKeys:String,CodingKey{
        case id = "category_id"
        case name = "category_name"
    }

}
//Have different keys than json
let decoder = JSONDecoder()
let category = try? decoder.decode(Category.self, from: data)
//: [Next](@next)
