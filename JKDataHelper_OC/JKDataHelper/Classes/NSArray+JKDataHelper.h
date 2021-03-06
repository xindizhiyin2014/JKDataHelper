//
//  NSArray+JKDataHelper.h
//  Pods
//
//  Created by Jack on 17/3/28.
//
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant ObjectType> (JKDataHelper)

- (nullable ObjectType)jk_objectWithIndex:(NSInteger)index;

/// 根据索引获取元素，并对元素类型进行判定，如果符合正常返回，不符合则返回nil
/// @param index 索引
/// @param theClass 指定的类型
- (nullable ObjectType)jk_objectWithIndex:(NSInteger)index
                      verifyClass:(Class)theClass;

- (nullable NSString*)jk_stringWithIndex:(NSInteger)index;

- (nullable NSNumber*)jk_numberWithIndex:(NSInteger)index;

- (nullable NSDecimalNumber *)jk_decimalNumberWithIndex:(NSInteger)index;

- (nullable NSArray*)jk_arrayWithIndex:(NSInteger)index;

- (nullable NSDictionary*)jk_dictionaryWithIndex:(NSInteger)index;

- (NSInteger)jk_integerWithIndex:(NSInteger)index;

- (NSUInteger)jk_unsignedIntegerWithIndex:(NSInteger)index;

- (BOOL)jk_boolWithIndex:(NSInteger)index;

- (short)jk_shortWithIndex:(NSInteger)index;

- (float)jk_floatWithIndex:(NSInteger)index;

- (CGFloat)jk_cgFloatWithIndex:(NSInteger)index;

- (double)jk_doubleWithIndex:(NSInteger)index;

- (long long)jk_longLongWithIndex:(NSInteger)index;

- (unsigned long long)jk_unsignedLongLongWithIndex:(NSInteger)index;
/**
 /// 获取数组元素中key对应的value的集合组成的数据，返回的数组内的元素是可以相同的
 @param key key
 @return key对应的value组成的数组
 */
- (nonnull NSMutableArray *)jk_valueArrayWithKey:(NSString *)key;

/// 获取数组元素中key对应的value的集合组成的数据，返回的数组内的元素是不相同
/// @param key key
- (nonnull NSArray *)jk_uniqueValuesWithKey:(NSString *)key;

/**
 升序

 @return 排序后的数组
 */
- (nonnull NSMutableArray *)jk_ascSort;

/**
 降序

 @return 排序后的数组
 */
- (nonnull NSMutableArray *)jk_descSort;



@end

NS_ASSUME_NONNULL_END

