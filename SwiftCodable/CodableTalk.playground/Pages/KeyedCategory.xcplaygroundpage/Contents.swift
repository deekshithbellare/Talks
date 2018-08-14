//: [Previous](@previous)

import Foundation
let data = """
{
"categories" :[
    {
     "category_id": "3",
     "category_name": "Nightlife"
  },
   {
    "category_id": "5",
    "category_name": "Dine-out"
   }
]
}
""".data(using:.utf8)!
struct Category:Codable {
    var id:String?
    var name:String?
    
    enum CodingKeys:String,CodingKey{
        case id = "category_id"
        case name = "category_name"
    }
}


let decoder = JSONDecoder()
//keyedCategories
let keyedCategories = try? decoder.decode([String:[Category]].self, from: data)
let category = keyedCategories!["categories"]
//get categories

//DefineStruct-ries
//SRIES
struct Categories:Codable
{
    var categories:[Category]?
}
let keyedCategories2 = try? decoder.decode(Categories.self, from: data)

//: [Next](@next)
