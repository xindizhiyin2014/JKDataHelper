//
//  NSDictionary+JKDataHelper.m
//  Pods
//
//  Created by Jack on 17/3/28.
//
//

#import "NSDictionary+JKDataHelper.h"

@implementation NSDictionary (JKDataHelper)

- (BOOL)jk_hasKey:(NSString *)key
{
    if (!key) {
#if DEBUG
        NSAssert(NO, @"key can't be nil");
#endif
        return NO;
    }
    return [self objectForKey:key] != nil;
}

- (nullable id)jk_objectForKey:(NSString *)key
{
    if (!key) {
#if DEBUG
        NSAssert(NO, @"key can't be nil");
#endif
        return nil;
    }
    return self[key];
}

- (nullable id)jk_objectForKeyPath:(NSString *)keyPath
{
    if (!keyPath) {
#if DEBUG
        NSAssert(NO, @"keyPath can't be nil");
#endif
        return  nil;
    }
    NSArray *keys = [keyPath componentsSeparatedByString:@"."];
    id result = nil;
    id obj = self;
    for (NSInteger i = 0; i < keys.count; i++) {
        NSString *key = keys[i];
        obj = [obj jk_objectForKey:key];
        if ((i < keys.count - 1)
            && (![obj isKindOfClass:[NSDictionary class]])) {
#if DEBUG
            NSAssert(NO, @"obj is not a Dictionary");
#endif
            result = nil;
            break;
        }
        result = obj;
    }
    return result;
}

- (nullable id)jk_objectForKey:(NSString *)key
                           verifyClass:(Class)theClass
{
    if (!theClass) {
#if DEBUG
        NSAssert(NO, @"theClass can't be nil");
#endif
        return nil;
    }
    id value = [self jk_objectForKey:key];
    if (value == nil || value == [NSNull null]){
        return nil;
    }
    if ([value isKindOfClass:theClass]) {
        return value;
    }
#if DEBUG
    NSAssert(NO, @"value is not the targetClass");
#endif
    return nil;
}

- (nullable id)jk_objectForKeyPath:(NSString *)keyPath
                               verifyClass:(Class)theClass
{
    if (!theClass) {
#if DEBUG
        NSAssert(NO, @"theClass can't be nil");
#endif
        return nil;
    }
    id value = [self jk_objectForKeyPath:keyPath];
    if (value == nil || value == [NSNull null]){
        return nil;
    }
    if ([value isKindOfClass:theClass]) {
        return value;
    }
#if DEBUG
    NSAssert(NO, @"value is not the targetClass");
#endif
    return nil;
}

- (nullable NSString*)jk_stringForKey:(NSString *)key
{
    return [self jk_objectForKey:key verifyClass:[NSString class]];
}

- (nullable NSString *)jk_stringForKeyPath:(NSString *)keyPath
{
    return [self jk_objectForKeyPath:keyPath verifyClass:[NSString class]];
}

- (nullable NSNumber*)jk_numberForKey:(NSString *)key
{
    return [self jk_objectForKey:key verifyClass:[NSNumber class]];
}

- (nullable NSNumber*)jk_numberForKeyPath:(NSString *)keyPath
{
    return [self jk_objectForKeyPath:keyPath verifyClass:[NSNumber class]];
}

- (nullable NSDecimalNumber *)jk_decimalNumberForKey:(NSString *)key
{
    id value = [self jk_objectForKey:key];
    if (value == nil || value == [NSNull null]){
        return nil;
    }
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    }
#if DEBUG
    NSAssert(NO, @"value is not a NSDecimalNumber");
#endif
    return nil;
}

- (nullable NSDecimalNumber *)jk_decimalNumberForKeyPath:(NSString *)keyPath
{
    id value = [self jk_objectForKeyPath:keyPath];
    if (value == nil || value == [NSNull null]){
        return nil;
    }
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    }
#if DEBUG
    NSAssert(NO, @"value is not a NSDecimalNumber");
#endif
    return nil;
}

- (nullable NSArray*)jk_arrayForKey:(NSString *)key
{
    return [self jk_objectForKey:key verifyClass:[NSArray class]];
}

- (nullable NSArray*)jk_arrayForKeyPath:(NSString *)keyPath
{
    return [self jk_objectForKeyPath:keyPath verifyClass:[NSArray class]];
}

- (nullable NSDictionary*)jk_dictionaryForKey:(NSString *)key
{
    return [self jk_objectForKey:key verifyClass:[NSDictionary class]];
}

- (nullable NSDictionary*)jk_dictionaryForKeyPath:(NSString *)keyPath
{
    return [self jk_objectForKeyPath:keyPath verifyClass:[NSDictionary class]];
}

- (NSInteger)jk_integerForKey:(NSString *)key
{
    id value = [self jk_objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get integerValue");
#endif
    return 0;
}

- (NSInteger)jk_integerForKeyPath:(NSString *)keyPath
{
    id value = [self jk_objectForKeyPath:keyPath];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get integerValue");
#endif
    return 0;
}

- (NSUInteger)jk_unsignedIntegerForKey:(NSString *)key
{
    id value = [self jk_numberForKey:key];
    return [value unsignedIntegerValue];
}

- (NSUInteger)jk_unsignedIntegerForKeyPath:(NSString *)keyPath
{
    id value = [self jk_numberForKeyPath:keyPath];
    return [value unsignedIntegerValue];
}

- (BOOL)jk_boolForKey:(NSString *)key
{
    id value = [self jk_objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get boolValue");
#endif
    return NO;
}

- (BOOL)jk_boolForKeyPath:(NSString *)keyPath
{
    id value = [self jk_objectForKeyPath:keyPath];
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get boolValue");
#endif
    return NO;
}

- (short)jk_shortForKey:(NSString *)key
{
    id value = [self jk_numberForKey:key];
    return [value shortValue];
}

- (short)jk_shortForKeyPath:(NSString *)keyPath
{
    id value = [self jk_numberForKeyPath:keyPath];
    return [value shortValue];
}

- (float)jk_floatForKey:(NSString *)key
{
    id value = [self jk_objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get floatValue");
#endif
    return 0;
}

- (float)jk_floatForKeyPath:(NSString *)keyPath
{
    id value = [self jk_objectForKeyPath:keyPath];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get floatValue");
#endif
    return 0;
}

- (CGFloat)jk_cgFloatForKey:(NSString *)key
{
    CGFloat value = (CGFloat)[self jk_floatForKey:key];
    return value;
}

- (CGFloat)jk_cgFloatForKeyPath:(NSString *)keyPath
{
    CGFloat value = (CGFloat)[self jk_floatForKeyPath:keyPath];
    return value;
}


- (double)jk_doubleForKey:(NSString *)key
{
    id value = [self jk_objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get doubleValue");
#endif
    return 0;
}

- (double)jk_doubleForKeyPath:(NSString *)keyPath
{
    id value = [self jk_objectForKeyPath:keyPath];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get doubleValue");
#endif
    return 0;
}

- (long long)jk_longLongForKey:(NSString *)key
{
    id value = [self jk_objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get longlongValue");
#endif
    return 0;
}

- (long long)jk_longLongForKeyPath:(NSString *)keyPath
{
    id value = [self jk_objectForKeyPath:keyPath];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get longlongValue");
#endif
    return 0;
}

- (unsigned long long)jk_unsignedLongLongForKey:(NSString *)key
{
    id value = [self jk_numberForKey:key];
    return [value unsignedLongLongValue];
}

- (unsigned long long)jk_unsignedLongLongForKeyPath:(NSString *)keyPath
{
    id value = [self jk_numberForKeyPath:keyPath];
    return [value unsignedLongLongValue];
}

@end
