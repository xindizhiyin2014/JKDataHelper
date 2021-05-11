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
            
            context("jk_object<T>(index:Int, verifyClass:T)") {
                let string_array = ["a","b","c"]
                it("index is right,class is not right") {
//                    #if DEBUG
                    expect{
                        string_array.jk_object(index: 0, verifyClass: Int.self)
                    }.to(throwAssertion())
//                    #else
//                    expect{
//                        string_array.jk_object(index: 0, verifyClass: Int.self)
//                    }.to(beNil())
//                    #endif
                }
                it("index is right,class is right") {
                    expect{
                        string_array.jk_object(index: 0, verifyClass: Int.self)
                    }.to(be("a"))
                }
            }
            
            context("jk_string(index:Int)") {
                let string_array = ["a","b","c"]
                let num_array = [1,2,3]
                it("array is string array") {
                    expect {
                        string_array.jk_string(index: 0)
                    }.to(be("a"))
                }
                
                it("array is not string Array") {
                    #if DEBUG
                    expect {
                        num_array.jk_string(index: 0)
                    }.to(throwAssertion())
                    #else
                    expect(num_array.jk_string(index: 0)) == nil
                    #endif
                }
            }
        }
    }
}


