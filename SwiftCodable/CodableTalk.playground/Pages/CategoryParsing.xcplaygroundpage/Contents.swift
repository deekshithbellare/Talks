//: [Previous](@previous)

import Foundation
//https://developers.zomato.com/documentation
//Let us parse zomato API's. Here is the segment of category API response
let data = """
{
    "category_id": "3",
    "category_name": "Nightlife"
}
""".data(using:.utf8)!
//Corresponding Struct
struct Category:Decodable {
    var category_id:String?
    var category_name:String?
}
//Initialise json decoder. This is a agent which will do the conversion work for us
let decoder = JSONDecoder()

//Now get category by decoding a object of type 'Category' from Data
let category = try? decoder.decode(Category.self, from: data)
//Check out 'PropertyListDecoder' used for PlistDecoding
//: [Next](@next)


