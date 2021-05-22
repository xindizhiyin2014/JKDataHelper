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
    
    public func jk_object<T>(index:Int, verifyClass:T.Type) -> Element? {
        let object:Element? = jk_object(index: index)
        if let element = object, type(of: element) != verifyClass {
            #if DEBUG
            assert(false, "object is not the verifyClass instance")
            #endif
            return nil
        }
        return object
    }
    
    public func jk_string(index:Int) -> String? {
        let obj = jk_object(index: index) as? String
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not a string")
            #endif
        }
        return obj
    }
    
    public func jk_number(index:Int) -> NSNumber? {
        let obj = jk_object(index: index) as? NSNumber
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not number")
            #endif
        }
        return obj
    }
    
    public func jk_decimalNumber(index:Int) -> NSDecimalNumber? {
       let obj = jk_object(index: index) as? NSDecimalNumber
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not decimalNumber")
            #endif
        }
        return obj
    }
    
    public func jk_array(index:Int) -> Array<Any>? {
        let element:Element? = jk_object(index: index)
        if let object = element {
            if (object as? Array<Any>) != nil {
                return object as? Array<Any>
            } else {
                #if DEBUG
                assert(false, "obj is not an Array")
                #endif
                return nil
            }
       }
       return nil
    }
    
    public func jk_dictionary(index:Int) -> Dictionary<String,Any>? {
       let obj = jk_object(index: index) as? Dictionary<String,Any>
        if obj == nil {
            #if DEBUG
            assert(false, "obj is not a Dictionary")
            #endif
        }
        return obj
    }
    
    public func jk_int(index:Int) -> Int? {
        let element:Element? = jk_object(index: index)
        if let object = element {
            if object is Int {
                return (object as! Int)
            } else if  object is String {
                return Int(object as! String)
            } else if object is NSNumber {
                let number:NSNumber = object as! NSNumber
                return number.intValue
            }
        }
        
        #if DEBUG
        assert(false, "can't get intValue")
        #endif
        return nil
    }
    
    public func jk_float(index:Int) -> Float? {
        let element:Element? = jk_object(index: index)
        if let object = element {
            if object is Float {
                return (object as! Float)
            }  else if  object is String {
               return Float(object as! String)
            } else if object is NSNumber {
                let number:NSNumber = object as! NSNumber
                return number.floatValue
            } else if object is Double {
                return Float(object as! Double)
            } else if object is Int {
                return Float(object as! Int)
            }
        }
        #if DEBUG
        assert(false, "can't get floatValue")
        #endif
        return nil
    }
    
    public func jk_double(index:Int) -> Double? {
        let element:Element? = jk_object(index: index)
        if let object = element {
            if object is Double {
                return (object as! Double)
            } else if  object is String {
               return Double(object as! String)
            } else if object is NSNumber {
                let number:NSNumber = object as! NSNumber
                return number.doubleValue
            } else if object is Float {
                return Double(object as! Float)
            } else if object is Int {
                return Double(object as! Int)
            }
        }
        #if DEBUG
        assert(false, "can't get doubleValue")
        #endif
        return nil
    }
    
    public func jk_char(index:Int) -> Character? {
        let element:Element? = jk_object(index: index)
        if let object = element {
            if object is String {
                let string:String = object as! String
                if string.count > 1 {
                    #if DEBUG
                    assert(false, "error:string.count > 1")
                    #else
                    return nil
                    #endif
                }
               return Character(string)
            } else if object is Character {
                return (object as! Character)
            }
        }
        #if DEBUG
        assert(false, "can't get charValue")
        #endif
        return nil
    }
    
    public func jk_values(key:String) -> Array<Any> {
        var values = [Any]()
        for obj in self {
            let dic = obj as? Dictionary<String, Any>;
            if dic != nil {
                let value = dic![key]
                if (value != nil) {
                    values.append(value as Any)
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
