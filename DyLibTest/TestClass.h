//
//  TestClass.h
//  CLITest
//
//  Created by Bill Thorgerson on 15/03/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestClass : NSObject

- (instancetype)initWithName:(NSString *)name andNumber:(int)n;

@property NSString *name;

@property int n;

@end

NS_ASSUME_NONNULL_END
