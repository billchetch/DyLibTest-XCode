//
//  TestClass.h
//  CLITest
//
//  Created by Bill Thorgerson on 15/03/26.
// And some changes made in cli

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

NS_ASSUME_NONNULL_BEGIN

typedef void* TestClassRef;

typedef struct {
    int book_id;
    char book_name[1280];
} Book;


TestClassRef create_object(int n);

int use_object_method(TestClassRef obj_ref);

void fill_object(TestClassRef obj_ref, Book *pBook);

void release_object(TestClassRef obj_ref);


NS_ASSUME_NONNULL_END

#ifdef __cplusplus
}
#endif


NS_ASSUME_NONNULL_BEGIN

@interface TestClass : NSObject

@property NSString *name;

@property int n;

- (instancetype)initWithNumber:(int)n;

- (void)incNumber;

- (void)fillBook:(Book *)pBook;

@end

NS_ASSUME_NONNULL_END
