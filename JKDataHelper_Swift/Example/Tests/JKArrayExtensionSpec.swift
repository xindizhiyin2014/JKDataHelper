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
        }
    }
}


