//: [Previous](@previous)

import Foundation

let data = """
{
    "category_id": "3",
    "category_name": "Nightlife"
}
""".data(using:.utf8)!
// The problem with category struct is that it's proprties name does not follow camel case convention. It's in snake case convention. Do we need to implement the encode method to fix this?
//Properties in CamelCase
struct Category:Decodable {
    var categoryId:String?
    var categoryName:String?
}
//Just add keyDecodingStrategy as convertFromSnakeCase to automatically convert JSON to model
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let category = try? decoder.decode(Category.self, from: data)
//KeyDecS - SC
//: [Next](@next)
