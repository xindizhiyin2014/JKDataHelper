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

- (nullable id)jk_objectForKey:(nullable NSString *)key
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

- (nullable NSString*)jk_stringForKey:(nonnull NSString *)key
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

- (nullable NSNumber*)jk_numberForKey:(nonnull NSString *)key
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

- (nullable NSDecimalNumber *)jk_decimalNumberForKey:(nonnull NSString *)key {
    
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

- (nullable NSArray*)jk_arrayForKey:(nonnull NSString *)key
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

- (nullable NSDictionary*)jk_dictionaryForKey:(nonnull NSString *)key
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

- (NSInteger)jk_integerForKey:(nonnull NSString *)key
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
- (NSUInteger)jk_unsignedIntegerForKey:(nonnull NSString *)key{
    
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

- (BOOL)jk_boolForKey:(nonnull NSString *)key{
    
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

- (int16_t)jk_int16ForKey:(nonnull NSString *)key{
    
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

- (int32_t)jk_int32ForKey:(nonnull NSString *)key{
    
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

- (int64_t)jk_int64ForKey:(nonnull NSString *)key{
    
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

- (char)jk_charForKey:(nonnull NSString *)key{
    
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

- (short)jk_shortForKey:(nonnull NSString *)key{
    
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

- (float)jk_floatForKey:(nonnull NSString *)key{
    
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

- (CGFloat)jk_cgFloatForKey:(nonnull NSString *)key{
    
    CGFloat value = (CGFloat)[self jk_floatForKey:key];
    return value;
}

- (double)jk_doubleForKey:(nonnull NSString *)key{
    
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

- (long long)jk_longLongForKey:(nonnull NSString *)key{
    
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

- (unsigned long long)jk_unsignedLongLongForKey:(nonnull NSString *)key{
    
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

- (nullable NSDate *)jk_dateForKey:(nonnull NSString *)key
               dateFormat:(nonnull NSString *)dateFormat{
    
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

- (CGPoint)jk_pointForKey:(nonnull NSString *)key{
    
    CGPoint point = CGPointFromString([self objectForKey:key]);
    return point;
}

- (CGSize)jk_sizeForKey:(nonnull NSString *)key{
    
    CGSize size = CGSizeFromString([self objectForKey:key]);
    return size;
}

- (CGRect)jk_rectForKey:(nonnull NSString *)key{
    
    CGRect rect = CGRectFromString([self objectForKey:key]);
    return rect;
}

@end
