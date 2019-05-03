//: [Previous](@previous)

import Foundation
//it's common practice to group the json using keys. In this case, array of categories is inside key 'categories'
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
//Decode dictionary where the key is string and value is the array of categories
let keyedCategories = try? decoder.decode([String:[Category]].self, from: data)
let category = keyedCategories!["categories"]

//Another way is to create a container class called categories
struct Categories:Codable {
    var categories:[Category]?
}

let categoriesStruct = try? decoder.decode(Categories.self, from: data)
//: [Next](@next)
