//: [Previous](@previous)
//We have two protocols in swift now - which can be used to parse the JSON.
//Our aim here is to convert (Decode) archiecture independent User JSON to our Swift User class and vice versa
import Foundation

//Encodable protocol has a init method in which we pass encoder - JSON to parse. Compiler does the mapping of JSON keys to model properties unless you need customization
class UserDecodable:Decodable {
    //Implement this only if needed
    required init(from decoder:Decoder) {
    }
}

// The oposite action of decoding is encoding where we convert our User model into architecture indepent JSON. The protocol for that is 'Encodable' which has a encode(from:) method where takes user model as input
class UserEncodable:Encodable {
    
    func encode(from encoder:Encoder){
        
    }
}

//Encodable and Decodable is combined into single protocol named Codable. So Codable = Encodable &  Decodable
class User:Codable {
}
