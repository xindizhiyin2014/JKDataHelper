//
//  NSArray+JKDataHelper.m
//  Pods
//
//  Created by Jack on 17/3/28.
//
//

#import "NSArray+JKDataHelper.h"
#import "NSObject+JK.h"


@implementation NSArray (JKDataHelper)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class targetClass = NSClassFromString(@"__NSArrayI");
    
        [self JKswizzleMethod:@selector(objectAtIndex:) withMethod:@selector(JKsafeObjectAtIndex:) withClass:targetClass];
    });
    

}


- (id)JKsafeObjectAtIndex:(NSInteger)index{
    if (index >=0 && index < self.count) {
        
        return [self JKsafeObjectAtIndex:index];
        
    }else{
    
        JKDataHelperLog(@"[__NSArrayI objectAtIndex:] index is greater than the array.count or the index is less than zero");
        
        return nil;
    }

}


@end
