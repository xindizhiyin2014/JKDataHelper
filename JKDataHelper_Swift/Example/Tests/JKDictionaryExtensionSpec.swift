//
//  JKDictionaryExtensionSpec.swift
//  JKDataHelper_Swift_Tests
//
//  Created by JackLee on 2021/5/20.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import JKDataHelper_Swift

class JKDictionaryExtensionSpec:QuickSpec {
    override func spec() {
        describe("JKDictionaryExtension") {
            let dic = ["name":"jack"]
            context("jk_hasKey(key:String?)") {
                it("has key") {
                    expect {
                        dic.jk_hasKey(key: "name")
                    }.to(beTrue())
                }
                
                it("don't has key") {
                    expect {
                        dic.jk_hasKey(key: "age")
                    }.to(beFalse())
                }
                
                it("key is nil") {
                    #if DEBUG
                    expect {
                        dic.jk_hasKey(key: nil)
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_hasKey(key: nil)
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_object(forKey key:String?)") {
                let dic = ["name":"jack"]

                it("object is nil") {
                    expect {
                        dic.jk_object(forKey: "age") as? String
                    }.to(beNil())
                }
                
                it("object is not nil") {
                    expect {
                        dic.jk_object(forKey: "name") as? String
                    }.to(equal("jack"))
                }
            }
            
            context("jk_object(forKeyPath keyPath:String?)") {
                let personDic = ["name":"jack"]
                let dic = ["person":personDic]
                it("object is nil") {
                    expect {
                        dic.jk_object(forKeyPath: "person.age")
                    }.to(beNil())
                }
                
                it("object is not nil") {
                    expect {
                        dic.jk_object(forKeyPath: "person.name") as? String
                    }.to(equal("jack"))
                }
                
            }
            
            context("jk_object<T>(forKey key:String?, verifyClass:T)") {
                let dic = ["name":"jack"]
                it("verifyClass is right") {
                    expect {
                        dic.jk_object(forKey: "name", verifyClass: String.self) as? String
                    }.to(equal("jack"))
                }
                
                it("verifyClass is not right") {
                    #if DEBUG
                    expect {
                        dic.jk_object(forKey: "name", verifyClass: Array<Any>.self)
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_object(forKey: "name", verifyClass: Array<Any>.self)
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_object<T>(forKeyPath keyPath:String?,verifyClass:T)") {
                let personDic = ["name":"jack"]
                let dic = ["person":personDic]
                it("verifyClass is right") {
                    expect {
                        dic.jk_object(forKeyPath: "person.name", verifyClass: String.self) as? String
                    }.to(equal("jack"))
                }
                
                it("verifyClass is not right") {
                    #if DEBUG
                    expect {
                        dic.jk_object(forKeyPath: "person.name", verifyClass: Array<Any>.self)
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_object(forKeyPath: "person.name", verifyClass: Array<Any>.self)
                    }.to(beNil())
                    #endif
                }
                
            }
            
            context("jk_string(forKey key:String?)") {
                let stringDic = ["name":"jack"]
                let intDic = ["age":18]
                
                it("object is string") {
                    expect {
                        stringDic.jk_string(forKey: "name")
                    }.to(equal("jack"))
                }
                
                it("object is not string") {
                    #if DEBUG
                    expect {
                        intDic.jk_string(forKey: "age")
                    }.to(throwAssertion())
                    #else
                    expect {
                        intDic.jk_string(forKey: "age")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_string(forKeyPath keyPath:String?)") {
                let personDic = ["name":"jack","age":18] as [String : Any]
                let dic = ["person":personDic]
                it("object is string") {
                    expect {
                        dic.jk_string(forKeyPath: "person.name")
                    }.to(equal("jack"))
                }
                
                it("object is not string") {
                    #if DEBUG
                    expect {
                        dic.jk_string(forKeyPath: "person.age")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_string(forKeyPath: "person.age")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_number(forKey key:String?)") {
                let num = NSNumber.init(value: 1)
                let numDic = ["num":num]
                let personDic = ["name":"jack"]
                it("object is num") {
                    expect {
                        numDic.jk_number(forKey: "num")
                    }.to(equal(NSNumber.init(value: 1)))
                }
                
                it("object is not num") {
                    #if DEBUG
                    expect {
                        personDic.jk_number(forKey: "name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_number(forKey: "name")
                    }.to(beNil())
                    #endif
                }
                
            }
            
            context("jk_number(forKeyPath keyPath:String?)") {
                let num = NSNumber.init(value: 18)
                let personDic = ["name":"jack","age":num] as [String : Any]
                let dic = ["person":personDic]
                it("object is num") {
                    expect {
                        dic.jk_number(forKeyPath: "person.age")
                    }.to(equal(NSNumber.init(value: 18)))
                }
                it("object is not num") {
                    #if DEBUG
                    expect {
                        dic.jk_number(forKeyPath: "person.name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_number(forKeyPath: "person.name")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_decimalNumber(forKey key:String?)") {
                let num = NSDecimalNumber.init(value: 18)
                let personDic = ["name":"jack","age":num] as [String : Any]
                it("object is decimalNum") {
                    expect {
                        personDic.jk_decimalNumber(forKey: "age")
                    }.to(equal(NSDecimalNumber.init(value: 18)))
                }
                
                it("object is not decimalNum") {
                    #if DEBUG
                    expect {
                        personDic.jk_decimalNumber(forKey: "name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_decimalNumber(forKey: "name")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_decimalNumber(forKeyPath keyPath:String?)") {
                let num = NSDecimalNumber.init(value: 18)
                let personDic = ["name":"jack","age":num] as [String : Any]
                let dic = ["person":personDic]
                it("object is decimalNum") {
                    expect {
                        dic.jk_decimalNumber(forKeyPath: "person.age")
                    }.to(equal(NSDecimalNumber.init(value: 18)))
                }
                it("object is not decimalNum") {
                    #if DEBUG
                    expect {
                        dic.jk_dictionary(forKeyPath: "person.name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_dictionary(forKeyPath: "person.name")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_array(forKey key:String?)") {
                let array = [1,2,3]
                let arrayDic = ["array":array]
                let personDic = ["name":"jack"]

                it("object is array") {
                    expect {
                        arrayDic.jk_array(forKey: "array") as? Array<Int>
                    }.to(equal([1,2,3]))
                }
                
                it("object is not array") {
                    #if DEBUG
                    expect {
                        personDic.jk_array(forKey: "name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_array(forKey: "name")
                    }.to(beNil())
                    #endif
                }
                
            }
            
            context("jk_array(forKeyPath keyPath:String?)") {
                let friends = ["lisa","bruces"]
                let personDic = ["friends":friends,"name":"jack"] as [String : Any]
                let dic = ["person":personDic]
                it("object is array") {
                    expect {
                        dic.jk_array(forKeyPath: "person.friends") as? Array<String>
                    }.to(equal(["lisa","bruces"]))
                }
                
                it("object is not array") {
                    #if DEBUG
                    expect {
                        dic.jk_array(forKeyPath: "person.name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_array(forKeyPath: "person.name")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_dictionary(forKey key:String?)") {
                let teacher = ["name":"geda"]
                
                let personDic = ["name":"jack","teacher":teacher] as [String : Any]
                it("object is dic") {
                    expect {
                        personDic.jk_dictionary(forKey: "teacher") as? [String:String]
                    }.to(equal(["name":"geda"]))
                }
                
                it("object is not dic") {
                    #if DEBUG
                    expect {
                        personDic.jk_dictionary(forKey: "name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_dictionary(forKey: "name")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_dictionary(forKeyPath keyPath:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["name":"jack","teacher":teacher] as [String : Any]
                let dic = ["person":personDic]
                it("object is dic") {
                    expect {
                        dic.jk_dictionary(forKeyPath: "person.teacher") as? [String:String]
                    }.to(equal(["name":"geda"]))
                }
                
                it("object is not dic") {
                    #if DEBUG
                    expect {
                        dic.jk_dictionary(forKeyPath: "person.name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_dictionary(forKeyPath: "person.name")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_int(forKey key:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["age":18,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher] as [String : Any];
                
                it("object is int") {
                    expect {
                        personDic.jk_int(forKey: "age")
                    }.to(equal(18))
                }
                
                it("object is num") {
                    expect {
                        personDic.jk_int(forKey: "grade")
                    }.to(equal(1))
                }
                
                it("object is numString") {
                    expect {
                        personDic.jk_int(forKey: "code")
                    }.to(equal((1)))
                }
                
                it("object is not numString") {
                    expect {
                        personDic.jk_int(forKey: "name")
                    }.to(beNil())
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        personDic.jk_int(forKey: "teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_int(forKey: "teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_int(forKeyPath keyPath:String?)") {
                
                let teacher = ["name":"geda"]
                let personDic = ["age":18,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher] as [String : Any];
                let dic = ["person":personDic]
                it("object is int") {
                    expect {
                        dic.jk_int(forKeyPath: "person.age")
                    }.to(equal(18))
                }
                
                it("object is num") {
                    expect {
                        dic.jk_int(forKeyPath: "person.grade")
                    }.to(equal(1))
                }
                
                it("object is numString") {
                    expect {
                        dic.jk_int(forKeyPath: "person.code")
                    }.to(equal((1)))
                }
                
                it("object is not numString") {
                    expect {
                        dic.jk_int(forKeyPath: "person.name")
                    }.to(beNil())
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        dic.jk_int(forKeyPath: "person.teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_int(forKeyPath: "person.teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_bool(forKey key:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"true":"true","false":"false"] as [String : Any];
                it("object is BOOL") {
                    expect {
                        personDic.jk_bool(forKey: "male")
                    }.to(beTrue())
                }
                
                it("object is num") {
                    expect {
                        personDic.jk_bool(forKey: "grade")
                    }.to(beTrue())
                }
                
                it("object is numString") {
                    expect {
                        personDic.jk_bool(forKey: "code")
                    }.to(beNil())
                }
                
                it("object is not numString") {
                    expect {
                        personDic.jk_bool(forKey: "name")
                    }.to(beNil())
                }
                
                it("object is trueString") {
                    expect {
                        personDic.jk_bool(forKey: "true")
                    }.to(beTrue())
                }
                
                it("object is falseString") {
                    expect {
                        personDic.jk_bool(forKey: "false")
                    }.to(beFalse())
                }
                it("object is dic") {
                    #if DEBUG
                    expect {
                        personDic.jk_bool(forKey: "teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_bool(forKey: "teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_bool(forKeyPath keyPath:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"true":"true","false":"false"] as [String : Any];
                let dic = ["person":personDic]
                it("object is BOOL") {
                    expect {
                        dic.jk_bool(forKeyPath: "person.male")
                    }.to(beTrue())
                }
                
                it("object is num") {
                    expect {
                        dic.jk_bool(forKeyPath: "person.grade")
                    }.to(beTrue())
                }
                
                it("object is numString") {
                    expect {
                        dic.jk_bool(forKeyPath: "person.code")
                    }.to(beNil())
                }
                
                it("object is not numString") {
                    expect {
                        dic.jk_bool(forKeyPath: "person.name")
                    }.to(beNil())
                }
                
                it("object is trueString") {
                    expect {
                        dic.jk_bool(forKeyPath: "person.true")
                    }.to(beTrue())
                }
                
                it("object is falseString") {
                    expect {
                        dic.jk_bool(forKeyPath: "person.false")
                    }.to(beFalse())
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        dic.jk_bool(forKeyPath: "person.teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_bool(forKeyPath: "person.teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_char(forKey key:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"score":"A"] as [String : Any];
                it("object is char") {
                    expect {
                        personDic.jk_char(forKey: "score")
                    }.to(equal("A"))
                }
                
                it("object is num") {
                    #if DEBUG
                    expect {
                        personDic.jk_char(forKey: "grade")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_char(forKey: "grade")
                    }.to(beNil())
                    #endif
                }
                
                it("object is numString") {
                    expect {
                        personDic.jk_char(forKey: "code")
                    }.to(equal("1"))
                }
                
                it("object is not numString") {
                    #if DEBUG
                    expect {
                        personDic.jk_char(forKey: "name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_char(forKey: "name")
                    }.to(beNil())
                    #endif
                    
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        personDic.jk_char(forKey: "teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_char(forKey: "teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_char(forKeyPath keyPath:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"score":"A"] as [String : Any];
                let dic = ["person":personDic]
                it("object is char") {
                    expect {
                        dic.jk_char(forKeyPath: "person.score")
                    }.to(equal("A"))
                }
                
                it("object is num") {
                    #if DEBUG
                    expect {
                        dic.jk_char(forKeyPath: "person.grade")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_char(forKeyPath: "person.grade")
                    }.to(beNil())
                    #endif
                }
                
                it("object is numString") {
                    expect {
                        dic.jk_char(forKeyPath: "person.code")
                    }.to(equal("1"))
                }
                
                it("object is not numString") {
                    #if DEBUG
                    expect {
                        dic.jk_char(forKeyPath: "person.name")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_char(forKeyPath: "person.name")
                    }.to(beNil())
                    #endif
                   
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        dic.jk_char(forKeyPath: "person.teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_char(forKeyPath: "person.teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_float(forKey key:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"score":Float(1.1),"double":Double(2.2)] as [String : Any];
                it("object is Float") {
                    expect {
                        personDic.jk_float(forKey: "score")
                    }.to(beCloseTo(Float(1.1)))
                }
                
                it("object is Double") {
                    expect {
                        personDic.jk_float(forKey: "double")
                    }.to(beCloseTo(Float(2.2)))
                }
                it("object is num") {
                    expect {
                        personDic.jk_float(forKey: "grade")
                    }.to(beCloseTo(Float(1)))
                }
                it("object is numString") {
                    expect {
                        personDic.jk_float(forKey: "code")
                    }.to(beCloseTo(Float(1)))
                }
                
                it("object is not numString") {
                    expect {
                        personDic.jk_float(forKey: "name")
                    }.to(beNil())
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        personDic.jk_float(forKey: "teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_float(forKey: "teacher")
                    }.to(beNil())
                    #endif
                }
                
            }
            
            context("jk_float(forKeyPath keyPath:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"score":Float(1.1),"double":Double(2.2)] as [String : Any];
                let dic = ["person":personDic]
                it("object is Float") {
                    expect {
                        dic.jk_float(forKeyPath: "person.score")
                    }.to(beCloseTo(Float(1.1)))
                }
                
                it("object is Double") {
                    expect {
                        dic.jk_float(forKeyPath: "person.double")
                    }.to(beCloseTo(Float(2.2)))
                }
                it("object is num") {
                    expect {
                        dic.jk_float(forKeyPath: "person.grade")
                    }.to(beCloseTo(Float(1)))
                }
                it("object is numString") {
                    expect {
                        dic.jk_float(forKeyPath: "person.code")
                    }.to(beCloseTo(Float(1)))
                }
                
                it("object is not numString") {
                    expect {
                        dic.jk_float(forKeyPath: "person.name")
                    }.to(beNil())
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        dic.jk_float(forKeyPath: "person.teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_float(forKeyPath: "person.teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_double(forKey key:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"score":Double(1.1),"Float":Float(2.2)] as [String : Any];
                it("object is Float") {
                    expect {
                        personDic.jk_double(forKey: "score")
                    }.to(beCloseTo(Double(1.1)))
                }
                
                it("object is Double") {
                    expect {
                        personDic.jk_double(forKey: "Float")
                    }.to(beCloseTo(Double(2.2)))
                }
                it("object is num") {
                    expect {
                        personDic.jk_double(forKey: "grade")
                    }.to(beCloseTo(Double(1)))
                }
                it("object is numString") {
                    expect {
                        personDic.jk_double(forKey: "code")
                    }.to(beCloseTo(Double(1)))
                }
                
                it("object is not numString") {
                    expect {
                        personDic.jk_double(forKey: "name")
                    }.to(beNil())
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        personDic.jk_double(forKey: "teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        personDic.jk_double(forKey: "teacher")
                    }.to(beNil())
                    #endif
                }
            }
            
            context("jk_double(forKeyPath keyPath:String?)") {
                let teacher = ["name":"geda"]
                let personDic = ["male":true,"grade":NSNumber.init(value: 1),"code":"1","name":"jack","teacher":teacher,"score":Double(1.1),"Float":Double(2.2)] as [String : Any];
                let dic = ["person":personDic]
                it("object is Float") {
                    expect {
                        dic.jk_double(forKeyPath: "person.score")
                    }.to(beCloseTo(Double(1.1)))
                }
                
                it("object is Double") {
                    expect {
                        dic.jk_double(forKeyPath: "person.Float")
                    }.to(beCloseTo(Double(2.2)))
                }
                it("object is num") {
                    expect {
                        dic.jk_double(forKeyPath: "person.grade")
                    }.to(beCloseTo(Double(1)))
                }
                it("object is numString") {
                    expect {
                        dic.jk_double(forKeyPath: "person.code")
                    }.to(beCloseTo(Double(1)))
                }
                
                it("object is not numString") {
                    expect {
                        dic.jk_double(forKeyPath: "person.name")
                    }.to(beNil())
                }
                
                it("object is dic") {
                    #if DEBUG
                    expect {
                        dic.jk_double(forKeyPath: "person.teacher")
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic.jk_double(forKeyPath: "person.teacher")
                    }.to(beNil())
                    #endif
                }
            }
        
        }
    }
}
