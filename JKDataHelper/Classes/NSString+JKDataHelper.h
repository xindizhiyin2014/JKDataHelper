//
//  NSString+JKDataHelper.h
//  JKDataHelper
//
//  Created by JackLee on 2018/11/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JKDataHelper)


/**
 过滤掉空格

 @return 过滤后的字符串
 */
- (NSString *)jk_trimWhiteSpace;

/**
 过滤掉空格和换行符

 @return 过滤后的字符串
 */
- (NSString *)jk_trimWhiteSpaceAndNewLine;


/**
 将url的的完整字符串的query拼成字典

 @param urlString url的完整字符串
 @return 字典对象
 */
- (NSMutableDictionary *)jk_urlStringConvertToDictionary:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
