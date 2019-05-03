//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let data = """
{
    "category_id": "3",
    "category_name": "Nightlife"
}
""".data(using:.utf8)!
//Still not happy with the naming convention? If you want to have property name as just id or name, swift will not able map the json key to the model object property.
struct Category:Decodable {
    var id:String?
    var name:String?
    
    //We specifiy the mapping though a enum CodingKeys which confrom to protol CodingKey.
    enum CodingKeys:String,CodingKey{
        case id = "category_id"
        case name = "category_name"
    }
}
//CodingKeys is also used where we need a property outside the JSON such as Color. As an excercise remove codingKeys enum and try adding a new struct as property which does not confrom to codable and see what happens
let decoder = JSONDecoder()
let category = try? decoder.decode(Category.self, from: data)
//: [Next](@next)
