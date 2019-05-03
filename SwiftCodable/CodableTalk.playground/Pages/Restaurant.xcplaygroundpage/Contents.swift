//: [Previous](@previous)

import Foundation
//Let us inspect the JSON for Restaurant and decode as per our needs

let data = """
{
   "id":"16774318",
   "name":"Otto Enoteca & Pizzeria",
   "url":"https://www.zomato.com/new-york-city/otto-enoteca-pizzeria-greenwich-village",
  "average_cost_for_two":"60",
   "cusine":"American",
   "location":{
      "address":"1 5th Avenue, New York, NY 10003",
      "locality":"Greenwich Village",
      "city":"New York City"
   },
  
   "user_rating":{
      "aggregate_rating":"3.7",
      "rating_text":"Very Good",
      "rating_color":"5BA829",
      "votes":"1046"
   }
}
""".data(using:.utf8)!
//Restaurant class would look like this
//Let's assume cusine has predefined types, so makes a good case for Enum
//Location response seems to be standard for many API's in Zomato. So we will create a separate object
//Now restaurant rating is grouped in user_rating dictionary but I am just concerned about aggregate rating and I want it to be part of Restaurant. So I define two coding keys - One for  Restaurant and another for user rating
class Restaurant:Decodable {
    var id:String?
    var name:String?
    var url:String?
    var averageCostForTwo:String?
    var location:Location?
    
    var cusine:Cusine?
    enum Cusine:String,Codable {
        case asian = "Asian"
        case american = "American"
    }
    
    var aggregateRating:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case averageCostForTwo
        case location
        case userRating
        case cusine
    }
 
    enum UserRatingkeys: String, CodingKey {
        case aggregateRating
    }
  
    required init(from decoder:Decoder) {
        //Get top container
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try! container?.decode(String.self, forKey: .id)
        self.name = try!
            container?.decode(String.self, forKey: .name)
        self.averageCostForTwo = try! container?.decode(String.self, forKey: .averageCostForTwo)
        self.url = try!
            container?.decode(String.self, forKey: .url)
        
        //Decode location
        self.location = try! container?.decode(Location.self, forKey: .location)
        //Decode cusine
        self.cusine = try! container?.decode(Cusine.self, forKey: .cusine)
        
        //Get inner container mapping to UserRatingkeys
        let ratingContainer = try! container?.nestedContainer(keyedBy: UserRatingkeys.self, forKey:.userRating)
        //Fetch aggregate rating value from ratingContainer and assign to aggregateRating
        self.aggregateRating = try! ratingContainer?.decode(String.self, forKey: .aggregateRating)
    }
}

class Location:Decodable
{
    var address:String?
    var locality:String?
    var city:String?
}


let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let restaurant = try? decoder.decode(Restaurant.self, from: data)

// Tha's the end! Hopefully we can cover few advanced use cases in the next session.
