//
//  JKDictionaryExtension.swift
//  JKDataHelper_Swift
//
//  Created by JackLee on 2021/3/20.
//

import Foundation
extension Dictionary {
    
    public func jk_hasKey(key:String?) ->Bool {
        if key == nil {
            #if DEBUG
            assert(false, "key can't be nil")
            #endif
            return false
        }
        if self[key as! Key] != nil {
            return true
        }
        return false
    }
    
    public func jk_object(forKey key:String?) -> Any? {
        if key == nil {
            #if DEBUG
            assert(false, "key can't be nil")
            #endif
            return nil
        }
        return self[key as! Key]
    }
    
    public func jk_object(forKeyPath keyPath:String?) -> Any? {
        if keyPath == nil {
            #if DEBUG
            assert(false, "keyPath can't be nil")
            #endif
            return nil
        }
        let keys:Array<String>? = keyPath?.components(separatedBy: ".")
        var dic:Dictionary<Key,Value>? = self
        var object:Any? = nil
        if keys == nil {
            #if DEBUG
            assert(false, "keys can't be nil")
            #endif
            return nil
        }
        for key in keys! {
            let index = keys!.firstIndex(of: key)
            if index! < keys!.count - 1 {
                dic = dic!.jk_dictionary(forKey: key)
            } else if index == keys!.count - 1{
                object = dic!.jk_object(forKey: key)
            }
            if dic == nil {
                break
            }
        }
        return object
    }
    
    public func jk_object<T>(forKey key:String?, verifyClass:T) -> Any? {
        var object = jk_object(forKey: key)
        if  type(of: object) != type(of: verifyClass) {
            #if DEBUG
            assert(false, "object is not the verifyClass instance")
            #endif
            object = nil
        }
        return object
    }
    
    public func jk_object<T>(forKeyPath keyPath:String?,verifyClass:T) -> Any? {
        var object = jk_object(forKeyPath: keyPath)
        if  type(of: object) != type(of: verifyClass) {
            #if DEBUG
            assert(false, "object is not the verifyClass instance")
            #endif
            object = nil
        }
        return object
    }
    
    public func jk_string(forKey key:String?) -> String? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is String {
            return (object as! String)
        }
        #if DEBUG
        assert(false, "object is not a string")
        #endif
        return nil
    }
    
    public func jk_string(forKeyPath keyPath:String?) -> String? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is String {
            return (object as! String)
        }
        #if DEBUG
        assert(false, "object is not a string")
        #endif
        return nil
    }
    
    public func jk_number(forKey key:String?) -> NSNumber? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            return (object as! NSNumber)
        }
        #if DEBUG
        assert(false, "object is not a NSNumber")
        #endif
        return nil
    }
    
    public func jk_number(forKeyPath keyPath:String?) -> NSNumber? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            return (object as! NSNumber)
        }
        #if DEBUG
        assert(false, "object is not a NSNumber")
        #endif
        return nil
    }
    
    public func jk_decimalNumber(forKey key:String?) -> NSDecimalNumber? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is NSDecimalNumber {
            return (object as! NSDecimalNumber)
        }
        #if DEBUG
        assert(false, "object is not a NSDecimalNumber")
        #endif
        return nil
    }
    
    public func jk_decimalNumber(forKeyPath keyPath:String?) -> NSDecimalNumber? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is NSDecimalNumber {
            return (object as! NSDecimalNumber)
        }
        #if DEBUG
        assert(false, "object is not a NSDecimalNumber")
        #endif
        return nil
    }
    
    public func jk_array(forKey key:String?) -> Array<Any>? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is Array<Any> {
            return (object as! Array<Any>)
        }
        #if DEBUG
        assert(false, "object is not a Array")
        #endif
        return nil
    }
    
    public func jk_array(forKeyPath keyPath:String?) -> Array<Any>? {
        let object = jk_object(forKeyPath: keyPath)
        if object is Array<Any> {
            return (object as! Array<Any>)
        }
        #if DEBUG
        assert(false, "object is not a Array")
        #endif
        return nil
    }
    
    public func jk_dictionary(forKey key:String?) -> Dictionary<Key,Value>? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is Dictionary<Key,Value> {
            return (object as! Dictionary<Key,Value>)
        }
        #if DEBUG
        assert(false, "object is not a Dictionary")
        #endif
        return nil
    }
    
    public func jk_dictionary(forKeyPath keyPath:String?) -> Dictionary<Key,Value>? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is Dictionary<Key,Value> {
            return (object as! Dictionary<Key,Value>)
        }
        #if DEBUG
        assert(false, "object is not a Dictionary")
        #endif
        return nil
    }
    
    public func jk_int(forKey key:String?) -> Int? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.intValue
        }
        if object is String {
            let string:String = object as! String
            return Int(string)
        }
        #if DEBUG
        assert(false, "can't get intValue")
        #endif
        return nil
    }
    
    public func jk_int(forKeyPath keyPath:String?) -> Int? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.intValue
        }
        if object is String {
            let string:String = object as! String
            return Int(string)
        }
        #if DEBUG
        assert(false, "can't get intValue")
        #endif
        return nil
    }
    
    public func jk_bool(forKey key:String?) -> Bool? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.boolValue
        }
        if object is String {
            let string:String = object as! String
            return Bool(string)
        }
        #if DEBUG
        assert(false, "can't get a boolValue")
        #endif
        return nil
    }
    
    public func jk_bool(forKeyPath keyPath:String?) -> Bool? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.boolValue
        }
        if object is String {
            let string:String = object as! String
            return Bool(string)
        }
        #if DEBUG
        assert(false, "can't get a boolValue")
        #endif
        return nil
    }
    
    public func jk_char(forKey key:String?) -> Character? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is String {
            let string:String = object as! String
            return Character(string)
        }
        #if DEBUG
        assert(false, "can't get a Character")
        #endif
        return nil
    }
    
    public func jk_char(forKeyPath keyPath:String?) -> Character? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is String {
            let string:String = object as! String
            return Character(string)
        }
        #if DEBUG
        assert(false, "can't get a Character")
        #endif
        return nil
    }
    
    public func jk_float(forKey key:String?) -> Float? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.floatValue
        }
        if object is String {
            let string:String = object as! String
            return Float(string)
        }
        #if DEBUG
        assert(false, "can't get a Float")
        #endif
        return nil
    }
    
    public func jk_float(forKeyPath keyPath:String?) -> Float? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.floatValue
        }
        if object is String {
            let string:String = object as! String
            return Float(string)
        }
        #if DEBUG
        assert(false, "can't get a Float")
        #endif
        return nil
    }
    
    public func jk_double(forKey key:String?) -> Double? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.doubleValue
        }
        if object is String {
            let string:String = object as! String
            return Double(string)
        }
        #if DEBUG
        assert(false, "can't get a Double")
        #endif
        return nil
    }
    
    public func jk_double(forKeyPath keyPath:String?) -> Double? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is NSNumber {
            let num:NSNumber = object as! NSNumber
            return num.doubleValue
        }
        if object is String {
            let string:String = object as! String
            return Double(string)
        }
        #if DEBUG
        assert(false, "can't get a Double")
        #endif
        return nil
    }
    
    public func jk_date(forKey key:String?, format:String) -> Date? {
        let object = jk_object(forKey: key)
        if object == nil {
            return nil
        }
        if object is String {
            let string:String = object as! String
            let dataFormatter = DateFormatter()
            dataFormatter.dateFormat = format
            return dataFormatter.date(from: string)
        }
        #if DEBUG
        assert(false, "can't get a Date?")
        #endif
        return nil
    }
    
    public func jk_date(forKeyPath keyPath:String?, format:String) -> Date? {
        let object = jk_object(forKeyPath: keyPath)
        if object == nil {
            return nil
        }
        if object is String {
            let string:String = object as! String
            let dataFormatter = DateFormatter()
            dataFormatter.dateFormat = format
            return dataFormatter.date(from: string)
        }
        #if DEBUG
        assert(false, "can't get a Date?")
        #endif
        return nil
    }
    
    public func jk_point(forKey key:String) -> CGPoint? {
        let string = jk_string(forKey: key)
        if string == nil {
            return nil
        }
        return NSCoder.cgPoint(for: string!)
    }
    
    public func jk_point(forKeyPath keyPath:String) -> CGPoint? {
        let string = jk_string(forKeyPath: keyPath)
        if string == nil {
            return nil
        }
        return NSCoder.cgPoint(for: string!)
    }
    
    public func jk_size(forKey key:String?) -> CGSize? {
        let string = jk_string(forKey: key)
        if string == nil {
            return nil
        }
        return NSCoder.cgSize(for: string!)
    }
    
    public func jk_size(forKeyPath keyPath:String?) -> CGSize? {
        let string = jk_string(forKeyPath: keyPath)
        if string == nil {
            return nil
        }
        return NSCoder.cgSize(for: string!)
    }
    
    public func jk_rect(forKey key:String?) -> CGRect? {
        let string = jk_string(forKey: key)
        if string == nil {
            return nil
        }
        return NSCoder.cgRect(for: string!)
    }
    
    public func jk_rect(forKeyPath keyPath:String?) -> CGRect? {
        let string = jk_string(forKeyPath: keyPath)
        if string == nil {
            return nil
        }
        return NSCoder.cgRect(for: string!)
    }
    
}
