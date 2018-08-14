//: [Previous](@previous)
 // [Zomato API] (https://developers.zomato.com/documentation)
import Foundation
<<<<<<< HEAD
// Let us take a API from zomato to understand how Codable works
// Here is the segment from JSON data for the category API.
=======
//catJson
>>>>>>> f841d59c6d35ab6cd57a4ed8563dd26ec8e97d76
let data = """
{
    "category_id": "3",
    "category_name": "Nightlife"
}
""".data(using:.utf8)!
<<<<<<< HEAD
//Correponding category structure would look like this
struct Category:Decodable {
    var category_id:String
    var category_name:String
}
// Now to covert category data to category json, you need to create a JSON decoder.
let decoder = JSONDecoder()
//Then user the decoder to decode the object of type category from the data. That's it. You are done. No extra code needed.
let category = try? decoder.decode(Category.self, from: data)

//As an excercise checkout 'PropertyListDecoder()'
=======

//sCat
struct Category:Codable {
    var category_id:String
    var category_name:String
}

//jDec
let decoder = JSONDecoder()
//jCat
  let category = try? decoder.decode(Category.self, from: data)


>>>>>>> f841d59c6d35ab6cd57a4ed8563dd26ec8e97d76
//: [Next](@next)
