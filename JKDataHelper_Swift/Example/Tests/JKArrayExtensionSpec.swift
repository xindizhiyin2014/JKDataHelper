//
//  JKArrayExtensionSpec.swift
//  JKDataHelper_Swift_Tests
//
//  Created by JackLee on 2021/3/29.
//  Copyright © 2021 CocoaPods. All rights reserved.
//
import Foundation
import Quick
import Nimble
import JKDataHelper_Swift

class JKArrayExtensionSpec:QuickSpec {
    override func spec() {
        describe("JKArrayExtension") {
        
            context("jk_object(index:Int)") {
                let num_array = [1,2,3]
                it("index is less than 0") {
                    #if DEBUG
                    expect {
                        num_array.jk_object(index: -1)
                    }.to(throwAssertion())
                    #else
                    expect(num_array.jk_object(index: -1)).to(beNil())
                    #endif
                    
                }
                    
                it("index is greater than bounds") {
                    #if DEBUG
                    expect {
                        num_array.jk_object(index: 4)
                    }.to(throwAssertion())
                    #else
                    expect(num_array.jk_object(index: 4)).to(beNil())
                    #endif
                }

                it("index is right") {
                    expect(num_array.jk_object(index: 0)).to(equal(1))
                }
            }
            
            context("jk_object<T>(index:Int, verifyClass:T.Type)") {
                let string_array = ["a","b","c"]
                it("index is right,class is not right") {
                    #if DEBUG
                    expect{
                        string_array.jk_object(index: 0, verifyClass: Int.self)
                    }.to(throwAssertion())
                    #else
                    expect{
                        string_array.jk_object(index: 0, verifyClass: Int.self)
                    }.to(beNil())
                    #endif
                }
                it("index is right,class is right") {
                    expect{
                        string_array.jk_object(index: 0, verifyClass: String.self)
                    }.to(be("a"))
                }
            }
            
            context("jk_string(index:Int)") {
                let string_array = ["a","b","c"]
                let int_array = [1,2,3]
                it("array is stringArray") {
                    expect {
                        string_array.jk_string(index: 0)
                    }.to(be("a"))
                }
                
                it("array is not stringArray") {
                    #if DEBUG
                    expect {
                        int_array.jk_string(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect(int_array.jk_string(index: 0)) == nil
                    #endif
                }
            }
            
            context("jk_number(index:Int)") {
                let num1 = NSNumber.init(value: 1)
                let num2 = NSNumber.init(value: 2)
                let num3 = NSNumber.init(value: 3)
                let number_array = [num1,num2,num3]
                let string_array = ["a","b","c"]
                it("array is stringArray") {
                    #if DEBUG
                    expect {
                        string_array.jk_number(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect {
                        string_array.jk_number(index: 0)
                    }.to(beNil())
                    #endif
                }
                it("array is NumArray") {
                    expect {
                        number_array.jk_number(index: 0)
                    }.to(be(num1))
                }
            }
            
            context("jk_decimalNumber(index:Int)") {
                let num1 = NSDecimalNumber.init(value: 1)
                let num2 = NSDecimalNumber.init(value: 2)
                let num3 = NSDecimalNumber.init(value: 3)
                let number_array = [num1,num2,num3]
                let string_array = ["a","b","c"]
                
                it("array is stringArray") {
                    #if DEBUG
                    expect {
                        string_array.jk_decimalNumber(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect {
                        string_array.jk_decimalNumber(index: 0)
                    }.to(beNil())
                    #endif
                }
                
                it("array is DecimalArray") {
                    expect {
                        number_array.jk_decimalNumber(index: 0)
                    }.to(be(num1))
                }
            }
            
            context("jk_array(index:Int)") {
                let array1 = [1,2,3]
                let array2 = [2,3,4]
                let array3 = [3,4,5]
                let array_array = [array1,array2,array3]
                let string_array = ["a","b","c"]

                it("array is stringArray") {
                    #if DEBUG
                    expect {
                        string_array.jk_array(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect {
                        string_array.jk_array(index: 0)
                    }.to(beNil())
                    #endif
                }
                
                it("array is arrayArray") {
                    expect {
                        array_array.jk_array(index: 0) as? Array<Int>
                    }.to(equal(array1))
                }
            }
            
            context("jk_dictionary(index:Int)") {
                let dic1 = ["key":1]
                let dic2 = ["key":2]
                let dic3 = ["key":3]
                let dic_array = [dic1,dic2,dic3]
                let string_array = ["a","b","c"]
                it("array is stringArray") {
                    #if DEBUG
                    expect {
                        string_array.jk_dictionary(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect {
                        string_array.jk_dictionary(index: 0)
                    }.to(beNil())
                    #endif
                }
                it("array is dic_array") {
                    expect {
                        dic_array.jk_dictionary(index: 0) as? Dictionary<String,Int>
                    }.to(equal(dic1))
                }
            }
            
            context("jk_int(index:Int)") {
                let int_array = [1,2,3]
                let string_string_array = ["a","b","c"]
                let string_int_array = ["1","2","3"]
                let num1 = NSNumber.init(value: 1)
                let num2 = NSNumber.init(value: 2)
                let num3 = NSNumber.init(value: 3)
                let string_num_array = [num1,num2,num3]
                
                let dic1 = ["key":1]
                let dic2 = ["key":2]
                let dic3 = ["key":3]
                let dic_array = [dic1,dic2,dic3]
                
                it("array is string(String)Array") {
                    expect {
                        string_string_array.jk_int(index: 0)
                    }.to(beNil())
                }
                it("array is string(Int)Array") {
                    expect {
                        string_int_array.jk_int(index: 0)
                    }.to(be(1))
                }
                
                it("array is numArray") {
                    expect {
                        string_num_array.jk_int(index: 0)
                    }.to(be(1))
                }
                
                it("array is dicArray") {
                    #if DEBUG
                    expect {
                        dic_array.jk_int(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic_array.jk_int(index: 0)
                    }.to(beNil())
                    #endif
                }
                
                it("array is intArray") {
                    expect {
                        int_array.jk_int(index: 0)
                    }.to(be(1))
                }
            }
            
            context("jk_float(index:Int)") {
                let float1:Float = 1.1
                let float2:Float = 2.2
                let float3:Float = 3.3
                let float_array = [float1,float2,float3]
                let string_string_array = ["a","b","c"]
                let string_float_array = ["1.1","2.2","3.3"]
                
                let num1 = NSNumber.init(value: float1)
                let num2 = NSNumber.init(value: float2)
                let num3 = NSNumber.init(value: float3)
                let string_num_array = [num1,num2,num3]
                
                let dic1 = ["key":1]
                let dic2 = ["key":2]
                let dic3 = ["key":3]
                let dic_array = [dic1,dic2,dic3]
                
                let float_num_array = [1.1,2.2,3.3]
                
                it("array is string(String)Array") {
                    expect {
                        string_string_array.jk_float(index: 0)
                    }.to(beNil())
                }
                
                it("array is string(Float)Array") {
                    expect {
                        string_float_array.jk_float(index: 0)
                    }.to(equal(1.1))
                }
                
                it("array is string(Num)Array") {
                    expect {
                        string_num_array.jk_float(index: 0)
                    }.to(equal(1.1))
                }
                
                it("array is dicArray") {
                    #if DEBUG
                    expect {
                        dic_array.jk_float(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic_array.jk_float(index: 0)
                    }.to(beNil())
                    #endif
                }
                
                it("array is floatArray") {
                    expect {
                        float_array.jk_float(index: 0)
                    }.to(equal(1.1))
                }
                
                it("array is floatNumArray") {
                    expect {
                        float_num_array.jk_float(index: 0)
                    }.to(equal(1.1))
                }
            }
            
            context("jk_double(index:Int)") {
                
                let double_array = [1.1,2.2,3.3]
                let string_string_array = ["a","b","c"]
                let string_double_array = ["1.1","2.2","3.3"]
                
                let num1 = NSNumber.init(value: 1.1)
                let num2 = NSNumber.init(value: 2.2)
                let num3 = NSNumber.init(value: 3.3)
                let string_num_array = [num1,num2,num3]
                
                let dic1 = ["key":1]
                let dic2 = ["key":2]
                let dic3 = ["key":3]
                let dic_array = [dic1,dic2,dic3]
                
                let float1:Float = 1.1
                let float2:Float = 2.2
                let float3:Float = 3.3
                let float_array = [float1,float2,float3]
                
                it("array is string(String)Array") {
                    expect {
                        string_string_array.jk_double(index: 0)
                    }.to(beNil())
                }
                
                it("array is string(Float)Array") {
                    expect {
                        string_double_array.jk_double(index: 0)
                    }.to(equal(1.1))
                }
                
                it("array is string(Num)Array") {
                    expect {
                        string_num_array.jk_double(index: 0)
                    }.to(equal(1.1))
                }
                
                it("array is dicArray") {
                    #if DEBUG
                    expect {
                        dic_array.jk_double(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect {
                        dic_array.jk_double(index: 0)
                    }.to(beNil())
                    #endif
                }
                
                it("array is doubleArray") {
                    expect {
                        double_array.jk_double(index: 0)
                    }.to(equal(1.1))
                }
                
                it("array is floatArray") {
                    expect {
                        float_array.jk_double(index: 0)
                    }.to(beCloseTo(1.1))
                }
            }
        }
    }
}


