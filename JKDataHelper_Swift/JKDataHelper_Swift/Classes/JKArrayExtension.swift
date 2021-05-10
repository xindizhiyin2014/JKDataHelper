//
//  JKArrayExtension.swift
//  JKDataHelper_Swift
//
//  Created by JackLee on 2021/2/9.
//

import Foundation
extension Array {
    
   public func jk_object(index:Int) -> Element? {
        if index < 0 || index >= self.count {
            #if DEBUG
            assert(false, "out of bounds")
            #endif
           return nil
        }
        return self[index]
    }
    
    public func jk_object<T>(index:Int, verifyClass:T) -> Element? {
        var object:Element? = jk_object(index: index)
        if  type(of: object) != type(of: verifyClass) {
            #if DEBUG
            assert(false, "object is not the verifyClass instance")
            #endif
            object = nil
        }
        return object
    }
    
    public func jk_string(index:Int) -> String? {
        let obj = jk_object(index: index, verifyClass: String.self) as? String
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not a string")
            #endif
        }
        return obj
    }
    
    public func jk_number(index:Int) -> NSNumber? {
        let obj = jk_object(index: index, verifyClass: NSNumber.self) as? NSNumber
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not number")
            #endif
        }
        return obj
    }
    
    public func jk_decimalNumber(index:Int) -> NSDecimalNumber? {
       let obj = jk_object(index: index, verifyClass: NSDecimalNumber.self) as? NSDecimalNumber
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not decimalNumber")
            #endif
        }
        return obj
    }
    
    public func jk_array(index:Int) -> Array? {
       let obj = jk_object(index: index, verifyClass: Array.self) as? Array
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not an Array")
            #endif
        }
        return obj
    }
    
    public func jk_dictionary(index:Int) -> Dictionary<String,Any>? {
       let obj = jk_object(index: index, verifyClass: Dictionary<String,Any>.self) as? Dictionary<String,Any>
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not a Dictionary")
            #endif
        }
        return obj
    }
    
    public func jk_int(index:Int) -> Int? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Int(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.intValue
        }
        #if DEBUG
        assert(false, "can't get intValue")
        #endif
        return nil
    }
    
    public func jk_float(index:Int) -> Float? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Float(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.floatValue
        }
        #if DEBUG
        assert(false, "can't get floatValue")
        #endif
        return nil
    }
    
    public func jk_double(index:Int) -> Double? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Double(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.doubleValue
        }
        #if DEBUG
        assert(false, "can't get doubleValue")
        #endif
        return nil
    }
    
    public func jk_char(index:Int) -> Character? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Character(string)
        }
        #if DEBUG
        assert(false, "can't get charValue")
        #endif
        return nil
    }
    
    public func jk_date(index:Int,format:String) -> Date? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self{
            let string:String = object as! String
            if string.count > 0 {
                let dateFormater = DateFormatter.init()
                dateFormater.dateFormat = format
                return dateFormater.date(from: string)
            }
           return nil
        }
        #if DEBUG
        assert(false, "can't get Date")
        #endif
        return nil
    }
    
    public func jk_values(key:String) -> Array {
        var values = Array.init()
        for obj in self {
            if obj is Dictionary<String, Any> {
                let dic:Dictionary = obj as! Dictionary<String, Any>
               let value = dic[key]
                if (value != nil) {
                    values.append(value as! Element)
                }
            } else {
//                #warning("todo")
//                kvc 的处理
            }
        }
        return values
    }
    
//    func jk_uniqueValues(key:String) -> Array {
//        let array:Array = jk_values(key: key)
//        for item in array {
//        }
//        return set
//    }
    
}
