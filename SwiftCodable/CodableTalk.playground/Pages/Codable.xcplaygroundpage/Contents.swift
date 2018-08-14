//: [Previous](@previous)
//We have two protocols in swift now - which can be used to parse the JSON.
//Our aim here is to convert (Decode) archiecture independent User JSON to our Swift User class and vice versa
import Foundation
<<<<<<< HEAD
//Encodable protocol has a init method in which we pass encoder - JSON to parse. Compiler does the mapping of JSON keys to model properties unless you need customization
class UserDecodable:Decodable {
    //Implement this only if needed
    required init(from decoder:Decoder) {
    }
}
// The oposite action of decoding is encoding where we convert our User model into architecture indepent JSON. The protocol for that is 'Encodable' which has a encode(from:) method where takes user model as input
class UserEncodable:Encodable {
 
   
=======

class User:Codable
{
    var name:String?
    var id:Int?
    required init(from decoder:Decoder) {
       
    }
    
>>>>>>> f841d59c6d35ab6cd57a4ed8563dd26ec8e97d76
    func encode(from encoder:Encoder){
        
    }
}
<<<<<<< HEAD
//Encodable and Decodable is combined into single protocol named Codable. So Codable = Encodable &  Decodable
class User:Codable {
}
=======
//InitDeco
//EnCodeFrom
//Codable

>>>>>>> f841d59c6d35ab6cd57a4ed8563dd26ec8e97d76
//: [Next](@next)
