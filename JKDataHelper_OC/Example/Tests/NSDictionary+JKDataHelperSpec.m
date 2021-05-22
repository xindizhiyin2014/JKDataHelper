//
//  NSDictionary+JKDataHelperSpec.m
//  JKDataHelper
//
//  Created by JackLee on 2021/3/22.
//  Copyright 2021 HHL110120. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <JKDataHelper/NSDictionary+JKDataHelper.h>


SPEC_BEGIN(NSDictionary_JKDataHelperSpec)

describe(@"NSDictionary+JKDataHelper", ^{
    let(string_dic, ^id{
        return @{@"name":@"jack",@"country":@"China"};
    });
    let(num_dic, ^id{
        return @{@"age":@18,@"score":@85};
    });
    let(string_keyPath_dic, ^id{
        return @{@"person":@{@"name":@"jack",@"country":@"China"}};
    });
    let(num_keyPath_dic, ^id{
        return @{@"person":@{@"age":@18,@"score":@85}};
    });
    let(obj_dic, ^id{
        return @{@"obj":[NSObject new]};
    });
    let(array_dic, ^id{
        return @{@"friends":@[@"bruce",@"lisa"]};
    });
    let(array_keyPath_dic, ^id{
        return @{@"person":@{@"friends":@[@"bruce",@"lisa"]}};
    });
    let(dic_dic, ^id{
        return @{@"wife":@{@"name":@"lisa"}};
    });
    let(dic_keyPath_dic, ^id{
        return @{@"person":@{@"wife":@{@"name":@"lisa"}}};
    });
    let(obj_keyPath_dic, ^id{
        return @{@"person":@{@"obj":[NSObject new]}};
    });
    
    let(float_dic, ^id{
        return @{@"score":@90.5};
    });
    let(float_keyPath_dic, ^id{
        return @{@"person":@{@"score":@90.5}};
    });
    
    let(time_dic, ^id{
        return @{@"birthday":@"2000/01/01"};
    });
    
    let(time_keyPath_dic, ^id{
        return @{@"person":@{@"birthday":@"2000/01/01"}};
    });
    
    let(point_dic, ^id{
        return @{@"point":@"{1,2}"};
    });
    
    let(point_keyPath_dic, ^id{
        return @{@"person":@{@"point":@"{1,2}"}};
    });
    
    let(size_dic, ^id{
        return @{@"size":@"{2,3}"};
    });
    
    let(size_keyPath_dic, ^id{
        return @{@"person":@{@"size":@"{2,3}"}};
    });
    
    let(rect_dic, ^id{
        return @{@"rect":@"{{1,2},{2,3}}"};
    });
    
    let(rect_keyPath_dic, ^id{
        return @{@"person":@{@"rect":@"{{1,2},{2,3}}"}};
    });
    
    context(@"jk_hasKey", ^{
        it(@"key is nil", ^{
            NSString *key = nil;
            [[theBlock(^{
                [string_dic jk_hasKey:key];
            }) should] raiseWithReason:@"key can't be nil"];
        });
        it(@"has key", ^{
            [[theValue([string_dic jk_hasKey:@"name"]) should] beYes];
        });
        it(@"not has key", ^{
            [[theValue([string_dic jk_hasKey:@"abc"]) should] beNo];
        });
    });
    
    context(@"jk_objectForKey", ^{
        it(@"key is nil", ^{
            NSString *key = nil;
            [[theBlock(^{
                [string_dic jk_objectForKey:key];
            }) should] raiseWithReason:@"key can't be nil"];
        });
        
    });
    
    context(@"jk_objectForKeyPath", ^{
        it(@"keyPath is nil", ^{
            NSString *keyPath = nil;
            [[theBlock(^{
                [string_keyPath_dic jk_objectForKeyPath:keyPath];
            }) should] raiseWithReason:@"keyPath can't be nil"];
        });
        it(@"keyPath don't contain '.'", ^{
            NSString *keyPath = @"person";
            [[[string_keyPath_dic jk_objectForKeyPath:keyPath] should] beKindOfClass:[NSDictionary class]];
        });
        it(@"keyPath contain '.'", ^{
            NSString *keyPath = @"person.name";
            [[[string_keyPath_dic jk_objectForKeyPath:keyPath] should] equal:@"jack"];
        });
    });
    
    context(@"jk_stringForKey", ^{
        it(@"value is string", ^{
            [[[string_dic jk_stringForKey:@"name"] should] equal:@"jack"];
        });
        it(@"value is not string", ^{
            [[theBlock(^{
                [num_dic jk_stringForKey:@"age"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_stringForKeyPath", ^{
        it(@"value is string", ^{
            [[[string_keyPath_dic jk_stringForKeyPath:@"person.name"] should] equal:@"jack"];
        });
        it(@"value is not string", ^{
            [[theBlock(^{
                [num_keyPath_dic jk_stringForKeyPath:@"person.age"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_numberForKey", ^{
        it(@"value is number", ^{
            [[[num_dic jk_numberForKey:@"age"] should] equal:@18];
        });
        it(@"value is not number", ^{
            [[theBlock(^{
                [string_dic jk_numberForKey:@"name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_numberForKeyPath", ^{
        it(@"value is number", ^{
            [[[num_keyPath_dic jk_numberForKeyPath:@"person.age"] should] equal:@18];
        });
        it(@"value is not number", ^{
            [[theBlock(^{
                [string_keyPath_dic jk_numberForKeyPath:@"person.name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_decimalNumberForKey", ^{
        it(@"value is number", ^{
            [[[num_dic jk_decimalNumberForKey:@"age"] should] equal:[NSDecimalNumber numberWithInt:18]];
        });
        
        it(@"value is not number", ^{
            [[theBlock(^{
                [obj_dic jk_decimalNumberForKey:@"obj"];
            }) should] raiseWithReason:@"value is not a NSDecimalNumber"];
        });
    });
    
    context(@"jk_decimalNumberForKeyPath", ^{
        it(@"value is number", ^{
            [[[num_keyPath_dic jk_decimalNumberForKeyPath:@"person.age"] should] equal:[NSDecimalNumber numberWithInt:18]];
        });
        it(@"value is not number", ^{
            [[theBlock(^{
                [string_keyPath_dic jk_decimalNumberForKeyPath:@"person.name"];
            }) should] raiseWithReason:@"value is not a NSDecimalNumber"];
        });
    });
    
    context(@"jk_arrayForKey", ^{
        it(@"value is array", ^{
            [[[array_dic jk_arrayForKey:@"friends"] should] beKindOfClass:[NSArray class]];
        });
        it(@"value is string", ^{
            [[theBlock(^{
                [string_dic jk_arrayForKey:@"name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_arrayForKeyPath", ^{
        it(@"value is array", ^{
            [[[array_keyPath_dic jk_arrayForKeyPath:@"person.friends"] should] beKindOfClass:[NSArray class]];
        });
        it(@"value is string", ^{
            [[theBlock(^{
                [string_keyPath_dic jk_arrayForKeyPath:@"person.name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_dictionaryForKey", ^{
        it(@"value is Dic", ^{
            [[[dic_dic jk_dictionaryForKey:@"wife"] should] beKindOfClass:[NSDictionary class]];
        });
        it(@"value is string", ^{
            [[theBlock(^{
                [string_dic jk_dictionaryForKey:@"name"];
            })should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_dictionaryForKeyPath", ^{
        it(@"value is Dic", ^{
            [[[dic_keyPath_dic jk_dictionaryForKeyPath:@"person.wife"] should] beKindOfClass:[NSDictionary class]];
        });
        it(@"value is string", ^{
            [[theBlock(^{
                [string_keyPath_dic jk_dictionaryForKeyPath:@"person.name"];
            })should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_integerForKey", ^{
        it(@"value is num", ^{
            [[theValue([num_dic jk_integerForKey:@"age"]) should] equal:@18];
        });
        
        it(@"value is nil", ^{
            [[theValue([num_dic jk_integerForKey:@"abc"]) should] beZero];
        });
        
        it(@"value is obj", ^{
            [[theBlock(^{
                [obj_dic jk_integerForKey:@"obj"];
            }) should] raiseWithReason:@"can't get integerValue"];
        });
    });
    
    context(@"jk_integerForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([num_keyPath_dic jk_integerForKeyPath:@"person.age"]) should] equal:@18];
        });
        
        it(@"value is nil", ^{
            [[theValue([num_keyPath_dic jk_integerForKeyPath:@"person.abc"]) should] beZero];
        });
        it(@"value is obj", ^{
            [[theBlock(^{
                [obj_keyPath_dic jk_integerForKeyPath:@"person.obj"];
            }) should] raiseWithReason:@"can't get integerValue"];
        });
    });
    
    context(@"jk_unsignedIntegerForKey", ^{
        it(@"value is num", ^{
            [[theValue([num_dic jk_unsignedIntegerForKey:@"age"]) should] equal:@18];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [string_dic jk_unsignedIntegerForKey:@"name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_unsignedIntegerForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([num_keyPath_dic jk_unsignedIntegerForKeyPath:@"person.age"]) should] equal:@18];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                    [string_keyPath_dic jk_unsignedIntegerForKeyPath:@"person.name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_boolForKey", ^{
        it(@"value is num", ^{
            [[theValue([num_dic jk_boolForKey:@"age"]) should]beTrue];
        });
        it(@"value is string", ^{
            [[theValue([string_dic jk_boolForKey:@"name"]) should] beFalse];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_dic jk_boolForKey:@"obj"];
            }) should] raiseWithReason:@"can't get boolValue"];
        });
    });
    
    context(@"jk_boolForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([num_keyPath_dic jk_boolForKeyPath:@"person.age"]) should] beTrue];
        });
        it(@"value is string", ^{
            [[theValue([string_keyPath_dic jk_boolForKeyPath:@"person.name"]) should] beFalse];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_keyPath_dic jk_boolForKeyPath:@"person.obj"];
            }) should] raiseWithReason:@"can't get boolValue"];
        });
    });
    
    context(@"jk_shortForKey", ^{
        it(@"value is num", ^{
            [[theValue([num_dic jk_shortForKey:@"age"]) should] equal:@18];
        });
        
        it(@"value is not num", ^{
            [[theBlock(^{
                [string_dic jk_shortForKey:@"name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_shortForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([num_keyPath_dic jk_shortForKeyPath:@"person.age"]) should] equal:@18];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [string_keyPath_dic jk_shortForKeyPath:@"person.name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_floatForKey", ^{
        it(@"value is num", ^{
            [[theValue([float_dic jk_floatForKey:@"score"]) should] equal:90.5 withDelta:0.001];
        });
        
        it(@"value is string", ^{
            [[theValue([string_dic jk_floatForKey:@"name"]) should] beZero];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_dic jk_floatForKey:@"obj"];
            }) should] raiseWithReason:@"can't get floatValue"];
        });
    });
    
    context(@"jk_floatForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([float_keyPath_dic jk_floatForKeyPath:@"person.score"]) should] equal:90.5 withDelta:0.001];
        });
        it(@"value is string", ^{
            [[theValue([string_keyPath_dic jk_floatForKeyPath:@"person.name"]) should] beZero];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_keyPath_dic jk_floatForKeyPath:@"person.obj"];
            }) should] raiseWithReason:@"can't get floatValue"];
        });
    });
    
    context(@"jk_cgFloatForKey", ^{
        it(@"value is num", ^{
            [[theValue([float_dic jk_cgFloatForKey:@"score"]) should] equal:90.5 withDelta:0.001];
        });
        it(@"value is string", ^{
            [[theValue([string_dic jk_cgFloatForKey:@"name"]) should] beZero];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_dic jk_cgFloatForKey:@"obj"];
            }) should] raiseWithReason:@"can't get floatValue"];
        });
    });
    
    context(@"jk_cgFloatForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([float_keyPath_dic jk_cgFloatForKeyPath:@"person.score"]) should] equal:90.5 withDelta:0.01];
        });
        it(@"value is string", ^{
            [[theValue([string_keyPath_dic jk_cgFloatForKeyPath:@"person.name"]) should] beZero];
        });
        
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_keyPath_dic jk_cgFloatForKeyPath:@"person.obj"];
            }) should] raiseWithReason:@"can't get floatValue"];
        });
    });
    
    context(@"jk_doubleForKey", ^{
        it(@"value is num", ^{
            [[theValue([float_dic jk_doubleForKey:@"score"]) should] equal:90.5 withDelta:0.001];
        });
        it(@"value is string", ^{
            [[theValue([string_dic jk_doubleForKey:@"name"]) should] beZero];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_dic jk_doubleForKey:@"obj"];
            }) should] raiseWithReason:@"can't get doubleValue"];
        });
    });
    
    context(@"jk_doubleForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([float_keyPath_dic jk_doubleForKeyPath:@"person.score"]) should] equal:90.5 withDelta:0.001];
        });
        it(@"value is string", ^{
            [[theValue([string_keyPath_dic jk_doubleForKeyPath:@"person.name"]) should] beZero];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_keyPath_dic jk_doubleForKeyPath:@"person.obj"];
            }) should] raiseWithReason:@"can't get doubleValue"];
        });
    });
    
    context(@"jk_longLongForKey", ^{
        it(@"value is num", ^{
            [[theValue([num_dic jk_longLongForKey:@"age"]) should] equal:@18];
        });
        it(@"value is string", ^{
            [[theValue([string_dic jk_longLongForKey:@"name"]) should] beZero];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_dic jk_longLongForKey:@"obj"];
            }) should] raiseWithReason:@"can't get longlongValue"];
        });
    });
    
    context(@"jk_longLongForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([num_dic jk_longLongForKeyPath:@"age"]) should] equal:@18];
        });
        it(@"value is string", ^{
            [[theValue([string_keyPath_dic jk_longLongForKeyPath:@"person.name"]) should] beZero];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_keyPath_dic jk_longLongForKeyPath:@"person.obj"];
            }) should] raiseWithReason:@"can't get longlongValue"];
        });
    });
    
    context(@"jk_unsignedLongLongForKey", ^{
        it(@"value is num", ^{
            [[theValue([num_dic jk_unsignedLongLongForKey:@"age"]) should] equal:@18];
        });
        it(@"value is string", ^{
            [[theBlock(^{
                [string_dic jk_unsignedLongLongForKey:@"name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_dic jk_unsignedLongLongForKey:@"obj"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    context(@"jk_unsignedLongLongForKeyPath", ^{
        it(@"value is num", ^{
            [[theValue([num_keyPath_dic jk_unsignedLongLongForKeyPath:@"person.age"]) should] equal:@18];
        });
        it(@"value is string", ^{
            [[theBlock(^{
                [string_keyPath_dic jk_unsignedLongLongForKeyPath:@"person.name"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
        it(@"value is not num", ^{
            [[theBlock(^{
                [obj_keyPath_dic jk_unsignedLongLongForKeyPath:@"person.obj"];
            }) should] raiseWithReason:@"value is not the targetClass"];
        });
    });
    
    
    
});

SPEC_END
