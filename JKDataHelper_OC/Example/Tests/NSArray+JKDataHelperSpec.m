//
//  NSArray+JKDataHelperSpec.m
//  JKDataHelper
//
//  Created by JackLee on 2021/3/22.
//  Copyright 2021 HHL110120. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <JKDataHelper/NSArray+JKDataHelper.h>


SPEC_BEGIN(NSArray_JKDataHelperSpec)

describe(@"NSArray+JKDataHelper", ^{
    let(stringArray, ^id{
        return @[@"1",@"2",@"3"];
    });
    let(numberArray, ^id{
        return @[@1,@2,@3];
    });
    
    let(strings_Array, ^id{
        return @[@[@"1"],@[@"2"],@[@"3"]];
    });
    
    let(dic_array, ^id{
        return @[@{@"key":@"1"},@{@"key":@"2"},@{@"key":@"3"},@{@"key":@"1"}];
    });
    
    let(obj_array, ^id{
        NSObject *obj1 = [NSObject new];
        NSObject *obj2 = [NSObject new];
        NSObject *obj3 = [NSObject new];
        return @[obj1,obj2,obj3];
    });
    
    let(string_float_array, ^id{
        return @[@"1.1",@"2.2",@"3.3"];
    });
    
    let(number_float_array, ^id{
        return @[@(1.1),@(2.2),@(3.3)];
    });
    
    let(time_array, ^id{
        return @[@"2021/02/01",@"2021/02/02",@"2021/02/02"];
    });
    
    
    context(@"jk_objectWithIndex", ^{
        it(@"index < 0", ^{
            [[theBlock(^{
                [stringArray jk_objectWithIndex:-1];
            }) should] raiseWithReason:@"index < 0!"];
        });
        
        it(@"index out of bounds", ^{
            [[theBlock(^{
                [stringArray jk_objectWithIndex:5];
            }) should] raiseWithReason:@"index is out of bounds!"];
        });
        
        it(@"index >=0 && index < bounds", ^{
            id obj = [stringArray jk_objectWithIndex:1];
            [[theValue([obj isEqualToString:@"2"]) should] beYes];
        });
    });
    
    context(@"jk_objectWithIndex:verifyClass:", ^{
        it(@"the class is nil", ^{
            Class theClass = nil;
            [[theBlock(^{
                [stringArray jk_objectWithIndex:1 verifyClass:theClass];
            }) should] raiseWithReason:@"theClass can't be nil!"];
        });
        
        it(@"the class is NSNumber", ^{
            [[theBlock(^{
                [stringArray jk_objectWithIndex:1 verifyClass:NSNumber.class];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
        it(@"the class is NSString", ^{
            id obj = [stringArray jk_objectWithIndex:1 verifyClass:NSString.class];
            [[theValue([obj isEqualToString:@"2"]) should] beYes];
        });
    });
    
    context(@"jk_stringWithIndex", ^{
        it(@"obj is a NSString instance", ^{
            id obj = [stringArray jk_stringWithIndex:1];
            [[theValue([obj isEqualToString:@"2"]) should] beYes];
        });
        
        it(@"obj is not a NSString instance", ^{
            [[theBlock(^{
                [numberArray jk_stringWithIndex:1];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_numberWithIndex", ^{
        it(@"obj is NSString instance", ^{
            [[theBlock(^{
                [stringArray jk_numberWithIndex:1];
            }) should] raiseWithReason:@"value is not the targetClass"];
            
        });
        
        it(@"obj is NSNumber instance", ^{
            id obj = [numberArray jk_numberWithIndex:1];
            [[obj should] equal:@2];
        });
    });
    
    context(@"jk_decimalNumberWithIndex", ^{
        it(@"obj is NSString instance", ^{
            id obj = [stringArray jk_decimalNumberWithIndex:1];
            [[obj should] equal:[NSDecimalNumber decimalNumberWithString:@"2"]];
        });
        
        it(@"obj is NSNumber instance", ^{
            id obj = [numberArray jk_decimalNumberWithIndex:1];
            [[obj should] equal:[NSDecimalNumber decimalNumberWithDecimal:@(2).decimalValue]];
        });
        
        it(@"obj is Array", ^{
            [[theBlock(^{
                [strings_Array jk_decimalNumberWithIndex:1];
            }) should] raiseWithReason:@"value is not a NSDecimalNumber"];
        });
    });
    
    context(@"jk_arrayWithIndex", ^{
        it(@"obj is Array", ^{
            id obj = [strings_Array jk_arrayWithIndex:1];
            [[theValue([obj isKindOfClass:[NSArray class]]) should] beYes];
        });
        
        it(@"obj is string", ^{
            [[theBlock(^{
                [stringArray jk_arrayWithIndex:1];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_dictionaryWithIndex", ^{
        it(@"obj is Dictionary", ^{
            id obj = [dic_array jk_dictionaryWithIndex:1];
            [[theValue([obj isKindOfClass:[NSDictionary class]]) should] beYes];
        });
        
        it(@"obj is string", ^{
            [[theBlock(^{
                [stringArray jk_dictionaryWithIndex:1];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
        
    });
    
    context(@"jk_integerWithIndex", ^{
        it(@"element is NSString", ^{
            NSInteger obj = [stringArray jk_integerWithIndex:1];
            [[theValue(obj) should] equal:@(2)];
        });
        
        it(@"element is NSNumber", ^{
            NSInteger obj = [numberArray jk_integerWithIndex:1];
            [[theValue(obj) should] equal:@(2)];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_integerWithIndex:1];
            }) should] raiseWithReason:@"can't get intergeValue"];
        });
    
    });
    
    context(@"jk_unsignedIntegerWithIndex", ^{
        it(@"element is NSString", ^{
            [[theBlock(^{
                [stringArray jk_unsignedIntegerWithIndex:1];
            }) should] raiseWithReason:@"can't get unsignedIntegerValue"];
        });
        
        it(@"element is NSNumber", ^{
            NSUInteger obj = [numberArray jk_unsignedIntegerWithIndex:1];
            [[theValue(obj) should] equal:@(2)];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_unsignedIntegerWithIndex:1];
            }) should] raiseWithReason:@"can't get unsignedIntegerValue"];
        });
    
    });
    
    
    context(@"jk_boolWithIndex", ^{
        it(@"element is NSString", ^{
            BOOL obj = [stringArray jk_boolWithIndex:1];
            [[theValue(obj) should] equal:@(YES)];
        });
        
        it(@"element is NSNumber", ^{
            BOOL obj = [numberArray jk_boolWithIndex:1];
            [[theValue(obj) should] equal:@(YES)];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_boolWithIndex:1];
            }) should] raiseWithReason:@"can't get boolValue"];
        });
    
    });
    
    context(@"jk_shortWithIndex", ^{
        it(@"element is NSString", ^{
            [[theBlock(^{
                [stringArray jk_shortWithIndex:1];
            }) should] raiseWithReason:@"can't get shortValue"];
        });
        
        it(@"element is NSNumber", ^{
            short obj = [numberArray jk_shortWithIndex:1];
            [[theValue(obj) should] equal:@(2)];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_shortWithIndex:1];
            }) should] raiseWithReason:@"can't get shortValue"];
        });
    });
    
    context(@"jk_floatWithIndex", ^{
        it(@"element is NSString", ^{
            float obj = [string_float_array jk_floatWithIndex:1];
            [[theValue(obj) should] beWithin:@0.01 of:@2.2];
        });
        
        it(@"element is NSNumber", ^{
            float obj = [number_float_array jk_floatWithIndex:1];
            [[theValue(obj) should] beWithin:@0.01 of:@2.2];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_floatWithIndex:1];
            }) should] raiseWithReason:@"can't get floatValue"];
        });
    });
    
    context(@"jk_cgFloatWithIndex", ^{
        it(@"element is NSString", ^{
            CGFloat obj = [string_float_array jk_cgFloatWithIndex:1];
            [[theValue(obj) should] beWithin:@0.01 of:@2.2];
        });
        
        it(@"element is NSNumber", ^{
            CGFloat obj = [number_float_array jk_cgFloatWithIndex:1];
            [[theValue(obj) should] beWithin:@0.01 of:@2.2];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_cgFloatWithIndex:1];
            }) should] raiseWithReason:@"can't get floatValue"];
        });
    });
    
    context(@"jk_doubleWithIndex", ^{
        it(@"element is NSString", ^{
            CGFloat obj = [string_float_array jk_doubleWithIndex:1];
            [[theValue(obj) should] beWithin:@0.01 of:@2.2];
        });
        
        it(@"element is NSNumber", ^{
            CGFloat obj = [number_float_array jk_doubleWithIndex:1];
            [[theValue(obj) should] beWithin:@0.01 of:@2.2];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_doubleWithIndex:1];
            }) should] raiseWithReason:@"can't get doubleValue"];
        });
    });
    
    context(@"jk_longLongWithIndex", ^{
        it(@"element is NSString", ^{
            long long obj = [string_float_array jk_longLongWithIndex:1];
            [[theValue(obj) should] equal:@2];
        });
        
        it(@"element is NSNumber", ^{
            long long obj = [number_float_array jk_longLongWithIndex:1];
            [[theValue(obj) should] equal:@2];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_longLongWithIndex:1];
            }) should] raiseWithReason:@"can't get longLongValue"];
        });
    });
    
    context(@"jk_unsignedLongLongWithIndex", ^{
        it(@"element is NSString", ^{
            [[theBlock(^{
                [string_float_array jk_unsignedLongLongWithIndex:1];
            }) should] raiseWithReason:@"can't get unsignedLongLongValue"];
        });
        
        it(@"element is NSNumber", ^{
            unsigned long long obj = [number_float_array jk_unsignedLongLongWithIndex:1];
            [[theValue(obj) should] equal:@2];
        });
        
        it(@"element is an NSObject", ^{
            [[theBlock(^{
                [obj_array jk_unsignedLongLongWithIndex:1];
            }) should] raiseWithReason:@"can't get unsignedLongLongValue"];
        });
    });
    
    context(@"jk_dateWithIndex:dateFormat:", ^{
        it(@"dateFormat is nil", ^{
            NSString *dateFormat = nil;
            [[theBlock(^{
                [time_array jk_dateWithIndex:1 dateFormat:dateFormat];
            }) should] raiseWithReason:@"can't convert to NSDate"];
        });
        
        it(@"dateFormat is string", ^{
            NSString *dateFormat = @"yyyy/MM/dd";
            NSDate *date = [time_array jk_dateWithIndex:1 dateFormat:dateFormat];
            [[date should] beKindOfClass:[NSDate class]];
        });
        
        it(@"element is NSNumber", ^{
            NSString *dateFormat = @"yyyy/MM/dd";
            [[theBlock(^{
                [numberArray jk_dateWithIndex:1 dateFormat:dateFormat];
            }) should] raiseWithReason:@"value is not the targetClass"];
            
        });
        
    });
    
    context(@"jk_valueArrayWithKey", ^{
        it(@"key is exist", ^{
            NSArray *array = [dic_array jk_valueArrayWithKey:@"key"];
            [[array should] haveCountOf:4];
        });
        
        it(@"key is not exist", ^{
            NSArray *array = [dic_array jk_valueArrayWithKey:@"aaa"];
            [[array should] beEmpty];
        });
        
    });
    
    context(@"jk_uniqueValuesWithKey", ^{
        it(@"key is exist", ^{
            NSArray *array = [dic_array jk_uniqueValuesWithKey:@"key"];
            [[array should] haveCountOf:3];
        });
        
        it(@"key is not exist", ^{
            
            NSArray *array = [dic_array jk_uniqueValuesWithKey:@"aaa"];
            [[array should] beEmpty];
        });
        
    });
    
    context(@"jk_ascSort", ^{
        let(ascArray, ^id{
            return @[@1,@2,@3];
        });
        let(descArray, ^id{
            return @[@3,@2,@1];
        });
        it(@"ascArray", ^{
            [[[ascArray jk_ascSort] should] equal:ascArray];
        });
        
        it(@"mixArray", ^{
            NSArray *mixArray = @[@1,@3,@2];
            [[[mixArray jk_ascSort] should] equal:ascArray];
        });
        it(@"descArray", ^{
            [[[descArray jk_ascSort] should] equal:ascArray];
        });
    });
    
    context(@"jk_descSort", ^{
        let(ascArray, ^id{
            return @[@1,@2,@3];
        });
        let(descArray, ^id{
            return @[@3,@2,@1];
        });
        it(@"ascArray", ^{
            [[[ascArray jk_descSort] should] equal:descArray];
        });
        
        it(@"mixArray", ^{
            NSArray *mixArray = @[@1,@3,@2];
            [[[mixArray jk_descSort] should] equal:descArray];
        });
        it(@"descArray", ^{
            [[[descArray jk_descSort] should] equal:descArray];
        });
    });
    
   
    
});

SPEC_END
