// Generated by json_to_model

import Foundation

class Post : NSObject {

    
    var author : User? = nil
    

    
    var replies : Array<Reply> = []
    

    
    var title : String? = nil
    

    
    var summary : String? = nil
    

    
    var time : Int = 0
    

    
    var ID : Int = 0
    


   init(JSONDictionary: NSDictionary) {

 
        if (!(JSONDictionary["author"] is NSNull)) {
            self.author = User(JSONDictionary:JSONDictionary["author"] as NSDictionary)
        }
  
        for child in (JSONDictionary["replies"] as NSArray) {
        
            replies.append(Reply(JSONDictionary:child as NSDictionary))
        
        }
  
        if (!(JSONDictionary["title"] is NSNull)) {
            self.title = JSONDictionary["title"] as String?
        }
  
        if (!(JSONDictionary["summary"] is NSNull)) {
            self.summary = JSONDictionary["summary"] as String?
        }
  
        if (!(JSONDictionary["time"] is NSNull)) {
            self.time = JSONDictionary["time"]!.integerValue
        }
  
        if (!(JSONDictionary["id"] is NSNull)) {
            self.ID = JSONDictionary["id"]!.integerValue
        }
 
    }

    convenience init?(JSONData: NSData) {
        var error : NSErrorPointer = nil
        var result : NSDictionary? = NSJSONSerialization.JSONObjectWithData(JSONData, options:NSJSONReadingOptions.AllowFragments, error:error) as NSDictionary?
        if (result != nil) {
            self.init(JSONDictionary:result!)
        } else {
            self.init(JSONDictionary:NSMutableDictionary())
            return nil
        }
    }


    func JSONDictionary() -> NSDictionary {


        var dictionary : NSMutableDictionary = NSMutableDictionary()

 
        dictionary["author"] = (self.author == nil) ? NSNull() : self.author
  
        var _replies : NSMutableArray = NSMutableArray()
        dictionary["replies"] = _replies
        for __ in self.replies {
            
                _replies.addObject(__.JSONDictionary())
            
        }
  
        dictionary["title"] = (self.title != nil) ? self.title : NSNull()
  
        dictionary["summary"] = (self.summary != nil) ? self.summary : NSNull()
  
        dictionary["time"] = self.time
  
        dictionary["id"] = self.ID
 
        return dictionary;
    }

    func JSONData() -> NSData? {

        var error : NSErrorPointer = nil
        var data : NSData? = NSJSONSerialization.dataWithJSONObject(self.JSONDictionary(), options:nil, error:error)
        if (error != nil) {
            return nil
        }
        return data
    }

}