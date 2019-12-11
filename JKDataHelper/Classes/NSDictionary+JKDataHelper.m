//
//  NSDictionary+JKDataHelper.m
//  Pods
//
//  Created by Jack on 17/3/28.
//
//

#import "NSDictionary+JKDataHelper.h"

@interface NSDictionary()

@end

@implementation NSDictionary (JKDataHelper)

- (BOOL)jk_hasKey:(NSString *)key
{
    if (!key) {
        return NO;
    }
    return [self objectForKey:key] != nil;
}

- (nullable id)jk_objectForKey:(NSString *)key
                   verifyClass:(nullable Class)theClass
{
    id object = [self objectForKey:key];
    if (!theClass) {
        return object;
    }

    if (![theClass isSubclassOfClass:[NSObject class]]) {
#if DEBUG
        NSAssert(NO, @"theClass must be subClass of NSObject");
#endif
        return nil;
    }
        
    if ([object isKindOfClass:theClass]) {
        return object;
    }
    return nil;
}

- (NSString*)jk_stringForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"] || [[value description] isEqualToString:@"(null)"]){
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    return nil;
}

- (NSNumber*)jk_numberForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)jk_decimalNumberForKey:(NSString *)key {
    
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString *str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray*)jk_arrayForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

- (NSDictionary*)jk_dictionaryForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)jk_integerForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
- (NSUInteger)jk_unsignedIntegerForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (BOOL)jk_boolForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}

- (int16_t)jk_int16ForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

- (int32_t)jk_int32ForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

- (int64_t)jk_int64ForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (char)jk_charForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)jk_shortForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

- (float)jk_floatForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}

- (CGFloat)jk_cgFloatForKey:(NSString *)key{
    
    CGFloat value = (CGFloat)[self jk_floatForKey:key];
    return value;
}

- (double)jk_doubleForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (long long)jk_longLongForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

- (unsigned long long)jk_unsignedLongLongForKey:(NSString *)key{
    
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        NSNumber *num = [nf numberFromString:value];
        return  [num unsignedLongLongValue];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

- (NSDate *)jk_dateForKey:(NSString *)key dateFormat:(NSString *)dateFormat{
    
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        NSDateFormatter *formater = [[NSDateFormatter alloc]init];
        formater.dateFormat = dateFormat;
        return [formater dateFromString:value];
    }
    return nil;
}

- (CGPoint)jk_pointForKey:(NSString *)key{
    
    CGPoint point = CGPointFromString([self objectForKey:key]);
    return point;
}

- (CGSize)jk_sizeForKey:(NSString *)key{
    
    CGSize size = CGSizeFromString([self objectForKey:key]);
    return size;
}

- (CGRect)jk_rectForKey:(NSString *)key{
    
    CGRect rect = CGRectFromString([self objectForKey:key]);
    return rect;
}

@end
