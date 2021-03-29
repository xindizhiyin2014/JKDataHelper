//
//  NSDictionary+JKDataHelper.h
//  Pods
//
//  Created by Jack on 17/3/28.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (JKDataHelper)

- (BOOL)jk_hasKey:(NSString *)key;

- (nullable id)jk_objectForKey:(NSString *)key;

- (nullable id)jk_objectForKeyPath:(NSString *)keyPath;

/// 根据key获取元素值，并对元素类型进行判断
/// @param key key
/// @param theClass 进行判定的类
- (nullable ObjectType)jk_objectForKey:(NSString *)key
                          verifyClass:(Class)theClass;

- (nullable ObjectType)jk_objectForKeyPath:(NSString *)keyPath
                               verifyClass:(Class)theClass;

- (nullable NSString*)jk_stringForKey:(NSString *)key;

- (nullable NSString *)jk_stringForKeyPath:(NSString *)keyPath;

- (nullable NSNumber*)jk_numberForKey:(NSString *)key;

- (nullable NSNumber *)jk_numberForKeyPath:(NSString *)keyPath;

- (nullable NSDecimalNumber *)jk_decimalNumberForKey:(NSString *)key;

- (nullable NSDecimalNumber *)jk_decimalNumberForKeyPath:(NSString *)keyPath;

- (nullable NSArray*)jk_arrayForKey:(NSString *)key;

- (nullable NSArray*)jk_arrayForKeyPath:(NSString *)keyPath;

- (nullable NSDictionary*)jk_dictionaryForKey:(NSString *)key;

- (nullable NSDictionary*)jk_dictionaryForKeyPath:(NSString *)keyPath;

- (NSInteger)jk_integerForKey:(NSString *)key;

- (NSInteger)jk_integerForKeyPath:(NSString *)keyPath;

- (NSUInteger)jk_unsignedIntegerForKey:(NSString *)key;

- (NSUInteger)jk_unsignedIntegerForKeyPath:(NSString *)keyPath;

- (BOOL)jk_boolForKey:(NSString *)key;

- (BOOL)jk_boolForKeyPath:(NSString *)keyPath;

- (short)jk_shortForKey:(NSString *)key;

- (short)jk_shortForKeyPath:(NSString *)keyPath;

- (float)jk_floatForKey:(NSString *)key;

- (float)jk_floatForKeyPath:(NSString *)keyPath;

- (CGFloat)jk_cgFloatForKey:(NSString *)key;

- (CGFloat)jk_cgFloatForKeyPath:(NSString *)keyPath;

- (double)jk_doubleForKey:(NSString *)key;

- (double)jk_doubleForKeyPath:(NSString *)keyPath;

- (long long)jk_longLongForKey:(NSString *)key;

- (long long)jk_longLongForKeyPath:(NSString *)keyPath;

- (unsigned long long)jk_unsignedLongLongForKey:(NSString *)key;

- (unsigned long long)jk_unsignedLongLongForKeyPath:(NSString *)keyPath;

- (nullable NSDate *)jk_dateForKey:(NSString *)key
                        dateFormat:(NSString *)dateFormat;

- (nullable NSDate *)jk_dateForKeyPath:(NSString *)keyPath
                        dateFormat:(NSString *)dateFormat;

- (CGPoint)jk_pointForKey:(NSString *)key;

- (CGPoint)jk_pointForKeyPath:(NSString *)keyPath;

- (CGSize)jk_sizeForKey:(NSString *)key;

- (CGSize)jk_sizeForKeyPath:(NSString *)keyPath;

- (CGRect)jk_rectForKey:(NSString *)key;

- (CGRect)jk_rectForKeyPath:(NSString *)keyPath;


@end

NS_ASSUME_NONNULL_END

