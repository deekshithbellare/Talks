//: #Simplified JSON parsing with Codable
"""
{
"Sessions": [{
"session": 1,
"welcomeText": "Welcome",
"topic": "Simplified JSON parsing with Codable"
}]
}
"""
//JSON parsing in Swift has been painful. Excellent swift developer community has developed few libraries to simplify the parsing chain. Even then, we had a lot of boilerplate parsing code. Take a look at this example of Parsing Twitter API to fetch username. How can we simplify?
import Foundation
"""
{
    "Sessions": [{
    "session": 1,
    "welcomeText": "Welcome",
    "topic": "Simplified JSON parsing with Codable"
    }]
}
"""
//oldCode

let data = Data()
if let statusesArray = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]],
    let user = statusesArray?[0]["user"] as? [String: Any],
    let username = user["name"] as? String {
    print(username)
}
//Arch
//: [Next](@next)
