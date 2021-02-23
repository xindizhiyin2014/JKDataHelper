//
//  ArrayExtension.swift
//  JKDataHelper_Swift
//
//  Created by JackLee on 2021/2/9.
//

import Foundation
extension Array {
    
    func jk_object(index:Int) -> Element? {
        if index < 0 || index >= self.count {
           return nil
        }
        return self[index]
    }
    
    func jk_object<T>(index:Int, verifyClass:T) -> Element? {
        var object:Element? = jk_object(index: index)
        if  type(of: object) != type(of: verifyClass) {
            object = nil
        }
        return object
    }
    
    func jk_string(index:Int) -> String? {
        jk_object(index: index, verifyClass: String.self) as? String
    }
    
    func jk_number(index:Int) -> NSNumber? {
        jk_object(index: index, verifyClass: NSNumber.self) as? NSNumber
    }
    
    func jk_decimalNumber(index:Int) -> NSDecimalNumber? {
        jk_object(index: index, verifyClass: NSDecimalNumber.self) as? NSDecimalNumber
    }
    
    func jk_array(index:Int) -> Array? {
        jk_object(index: index, verifyClass: Array.self) as? Array
    }
    
    func jk_dictionary(index:Int) -> Dictionary<String,Any>? {
        jk_object(index: index, verifyClass: Dictionary<String,Any>.self) as? Dictionary<String,Any>
    }
    
    func jk_int8(index:Int) -> Int? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Int(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.intValue
        }
        return nil
    }
    
    func jk_int8(index:Int) -> Int8? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Int8(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.int8Value
        }
        return nil
    }
    
    func jk_int16(index:Int) -> Int16? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Int16(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.int16Value
        }
        return nil
    }
    
    func jk_int32(index:Int) -> Int32? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Int32(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.int32Value
        }
        return nil
    }
    
    func jk_int64(index:Int) -> Int64? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Int64(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.int64Value
        }
        return nil
    }
    
    func jk_char(index:Int) -> Character? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Character(string)
        }
        return nil
    }
    
    func jk_float(index:Int) -> Float? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Float(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.floatValue
        }
        return nil
    }
    
    func jk_double(index:Int) -> Double? {
        let object:Element? = jk_object(index: index)
        if  type(of: object) == String.self {
            let string:String = object as! String
           return Double(string)
        } else if type(of: object) == NSNumber.self {
            let number:NSNumber = object as! NSNumber
            return number.doubleValue
        }
        return nil
    }
    
    func jk_date(index:Int,format:String) -> Date? {
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
        return nil
    }
    
    func jk_values(key:String) -> Array<Element>? {
        var values = Array.init()
        for obj in self {
            if obj is Dictionary<String, Any> {
                let dic:Dictionary = obj as! Dictionary<String, Any>
               let value = dic[key]
                if (value != nil) {
                    values.append(value as! Element)
                }
            } else {
                #warning("todo")
//                kvc 的处理
            }
        }
        return values
    }
    
    func jk_uniqueValues(key:String) -> Array<Element> {
        let array:Array<Element>? = jk_values(key: key)
        let uniqueValues:Set = Set.init(arrayLiteral: array)
    }
    
}
