//: [Previous](@previous)

import Foundation
let data = """
{
   "id":"16774318",
   "name":"Otto Enoteca & Pizzeria",
   "url":"https://www.zomato.com/new-york-city/otto-enoteca-pizzeria-greenwich-village",
   "cusine":"American",
   "location":{
      "address":"1 5th Avenue, New York, NY 10003",
      "locality":"Greenwich Village",
      "city":"New York City"
   },
   "average_cost_for_two":"60",
   "user_rating":{
      "aggregate_rating":"3.7",
      "rating_text":"Very Good",
      "rating_color":"5BA829",
      "votes":"1046"
   }
}
""".data(using:.utf8)!
//SRest
class Restaurant:Codable {
    var id:String?
    var name:String?
    var url:String?
    var averageCostForTwo:String?
    var location:Location?
    
    var cusine:Cusine?
    enum Cusine:String,Codable {
        case asian
        case american
    }
    
    //ecusine
    
    //varAggR
    
    var aggregateRating:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case averageCostForTwo
        case location
        case userRating = "user_rating"
        case cusine
    }
    //Rcoding
    
    enum UserRatingkeys: String, CodingKey {
        case aggregateRating
    }
    //RRating
    
    required init(from decoder:Decoder) {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.id = try! container?.decode(String.self, forKey: .id)
        self.name = try!
            container?.decode(String.self, forKey: .name)
        self.location = try! container?.decode(Location.self, forKey: .location)
        self.cusine = try! container?.decode(Cusine.self, forKey: .cusine)
         let ratingContainer = try! container?.nestedContainer(keyedBy: UserRatingkeys.self, forKey:.userRating)
        self.aggregateRating = ratingContainer?.decode(String.self, forKey: .aggregateRating)
        
    }
    
    
    
    //RestDecoder
    
    //RContainer2
    //nestedContainer
    //argregateRating
}


//sLocation
class Location:Codable
{
    var address:String?
    var locality:String?
    var city:String?
}



    
    


 //createRes






//: [Next](@next)
