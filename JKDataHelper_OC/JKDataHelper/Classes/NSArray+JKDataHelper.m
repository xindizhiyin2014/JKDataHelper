//
//  NSArray+JKDataHelper.m
//  Pods
//
//  Created by Jack on 17/3/28.
//
//

#import "NSArray+JKDataHelper.h"

@implementation NSArray (JKDataHelper)

- (nullable id)jk_objectWithIndex:(NSInteger)index
{
    
    if (index < 0) {
#if DEBUG
        NSAssert(NO, @"index < 0!");
#endif
        return nil;
    }
    if (index < self.count) {
        return self[index];
    }
#if DEBUG
    NSAssert(NO, @"index is out of bounds!");
#endif
    return nil;
}

- (nullable id)jk_objectWithIndex:(NSInteger)index
                      verifyClass:(Class)theClass
{
    if (!theClass) {
#if DEBUG
        NSAssert(NO, @"theClass can't be nil!");
#endif
        return nil;
    }
    id object = [self jk_objectWithIndex:index];
    if ([object isKindOfClass:theClass]) {
        return object;
    }
#if DEBUG
    NSAssert(NO, @"value is not the targetClass");
#endif
    return nil;
}

- (nullable NSString*)jk_stringWithIndex:(NSInteger)index
{
    return [self jk_objectWithIndex:index verifyClass:[NSString class]];
}

- (nullable NSNumber*)jk_numberWithIndex:(NSInteger)index{
    
    return [self jk_objectWithIndex:index verifyClass:[NSNumber class]];
}

- (nullable NSDecimalNumber *)jk_decimalNumberWithIndex:(NSInteger)index{
    
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
#if DEBUG
        NSAssert(NO, @"value is not a NSDecimalNumber");
#endif
    return nil;
}

- (nullable NSArray*)jk_arrayWithIndex:(NSInteger)index{
    
    return [self jk_objectWithIndex:index verifyClass:[NSArray class]];
}

- (nullable NSDictionary*)jk_dictionaryWithIndex:(NSInteger)index{
    
    return [self jk_objectWithIndex:index verifyClass:[NSDictionary class]];
}

- (NSInteger)jk_integerWithIndex:(NSInteger)index{
    
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get intergeValue");
#endif
    return 0;
}

- (NSUInteger)jk_unsignedIntegerWithIndex:(NSInteger)index{
    
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get unsignedIntegerValue");
#endif
    return 0;
}

- (BOOL)jk_boolWithIndex:(NSInteger)index
{
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get boolValue");
#endif
    return NO;
}

- (short)jk_shortWithIndex:(NSInteger)index{
    
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get shortValue");
#endif
    return 0;
}
- (float)jk_floatWithIndex:(NSInteger)index{
    
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get floatValue");
#endif
    return 0;
}

- (CGFloat)jk_cgFloatWithIndex:(NSInteger)index{
    CGFloat value = (CGFloat)[self jk_floatWithIndex:index];
    return value;
}

- (double)jk_doubleWithIndex:(NSInteger)index
{
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get doubleValue");
#endif
    return 0;
}

- (long long)jk_longLongWithIndex:(NSInteger)index
{
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get longLongValue");
#endif
    return 0;
}

- (unsigned long long)jk_unsignedLongLongWithIndex:(NSInteger)index
{
    id value = [self jk_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
#if DEBUG
    NSAssert(NO, @"can't get unsignedLongLongValue");
#endif
    return 0;
}

- (nullable NSDate *)jk_dateWithIndex:(NSInteger)index
                           dateFormat:(NSString *)dateFormat {
    
    id value = [self jk_stringWithIndex:index];
    if (value && ![value isEqualToString:@""] && dateFormat) {
        NSDateFormatter *formater = [[NSDateFormatter alloc]init];
        formater.dateFormat = dateFormat;
        return [formater dateFromString:value];
    }
#if DEBUG
    NSAssert(NO, @"can't convert to NSDate");
#endif
    return nil;
}

- (nonnull NSMutableArray *)jk_valueArrayWithKey:(nonnull NSString *)key
{
    if (!key) {
#if DEBUG
        NSAssert(NO, @"key can not be nil");
#endif
        return nil;
    }
    NSMutableArray *values = [NSMutableArray new];
    for (NSObject *obj in self) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary *)obj;
            id value = [dic objectForKey:key];
            if (value) {
                [values addObject:value];
            }
        } else {
            SEL selector = NSSelectorFromString(key);
            if ([obj respondsToSelector:selector]) {
                id value = [obj valueForKey:key];
                if (value) {
                    [values addObject:value];
                }
            }
        }
    }
    return values;
}

- (nonnull NSArray *)jk_uniqueValuesWithKey:(nonnull NSString *)key
{
    if (!key) {
#if DEBUG
        NSAssert(NO, @"key can't be nil");
#endif
        return nil;
    }
    NSMutableSet *set = [NSMutableSet new];
    for (NSObject *obj in self) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary *)obj;
            id value = [dic objectForKey:key];
            if (value) {
                [set addObject:value];
            }
        } else {
            SEL selector = NSSelectorFromString(key);
            if ([obj respondsToSelector:selector]) {
                id value = [obj valueForKey:key];
                if (value) {
                    [set addObject:value];
                }
            }
        }
        
    }
    return [set allObjects];
}

- (nonnull NSMutableArray *)jk_ascSort
{
    NSMutableArray *array = (NSMutableArray *)self;
    if (![self isKindOfClass:[NSMutableArray class]]) {
        array = [NSMutableArray arrayWithArray:self];
    }
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] > [obj2 integerValue];
    }];
    return array;
}

- (nonnull NSMutableArray *)jk_descSort
{
    NSMutableArray *array = (NSMutableArray *)self;
    if (![self isKindOfClass:[NSMutableArray class]]) {
        array = [NSMutableArray arrayWithArray:self];
    }
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] < [obj2 integerValue];
    }];
    return array;
}

- (CGPoint)jk_pointWithIndex:(NSInteger)index
{
    NSString *value = [self jk_stringWithIndex:index];
    CGPoint point = CGPointFromString(value);
    return point;
}

- (CGSize)jk_sizeWithIndex:(NSInteger)index
{
    NSString *value = [self jk_stringWithIndex:index];
    CGSize size = CGSizeFromString(value);
    return size;
}

- (CGRect)jk_rectWithIndex:(NSInteger)index
{
    NSString *value = [self jk_stringWithIndex:index];
    CGRect rect = CGRectFromString(value);
    return rect;
}


@end
