//
//  TestClass.m
//  CLITest
//
//  Created by Bill Thorgerson on 15/03/26.
//

/*
 // MyCInterface.m
 #import "MyCInterface.h"
 #import "MyObjectiveCClass.h" // Import the actual Obj-C class header
 #import <objc/runtime.h> // Might be needed for advanced runtime interactions

 MyObjectiveCObjectRef create_object(void) {
     MyObjectiveCClass *obj = [[MyObjectiveCClass alloc] init];
     // Use __bridge_retained to inform ARC that ownership is transferred to C
     return (__bridge_retained MyObjectiveCObjectRef)obj;
 }

 void use_object_method(MyObjectiveCObjectRef obj_ref) {
     // Use __bridge to cast back to the Objective-C type without transferring ownership
     MyObjectiveCClass *obj = (__bridge MyObjectiveCClass *)obj_ref;
     [obj someMethod]; // Call the Objective-C method
 }

 void release_object(MyObjectiveCObjectRef obj_ref) {
     // Use __bridge_transfer to transfer ownership back to ARC for deallocation
     MyObjectiveCClass *obj = (__bridge_transfer MyObjectiveCClass *)obj_ref;
     // The object will be released by ARC here
 }

 
 */

#import "TestClass.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

int AddNumbers(int a, int b) {
    return a + b;
}

TestClassRef create_object(int n) {
    TestClass *obj = [[TestClass alloc] initWithNumber:n];
    // Use __bridge_retained to inform ARC that ownership is transferred to C
    return (__bridge_retained TestClassRef)obj;
}

int use_object_method(TestClassRef obj_ref) {
    // Use __bridge to cast back to the Objective-C type without transferring ownership
    TestClass *obj = (__bridge TestClass *)obj_ref;
    [obj incNumber];
    return obj.n;
    //[obj someMethod]; // Call the Objective-C method
}

void fill_object(TestClassRef obj_ref, Book *book) {
    TestClass *obj = (__bridge TestClass *)obj_ref;
    [obj fillBook: book];
}

void release_object(TestClassRef obj_ref) {
    // Use __bridge_transfer to transfer ownership back to ARC for deallocation
    TestClass *obj = (__bridge_transfer TestClass *)obj_ref;
    (void)obj;
    // The object will be released by ARC here
}


@implementation TestClass

- (instancetype)initWithNumber:(int)n {
    self = [super init]; // Initialize the superclass
    if (self) {
        // Assign values to instance variables or properties
        self.n = n;
        
    }
    return self;
}

- (void)incNumber{
    self.n++;
}

- (void)fillBook:(Book *)pBook{
    pBook->book_id = self.n;
    pBook->book_name[0] = 's';
    pBook->book_name[1] = 'o';
}

@end

NS_ASSUME_NONNULL_END
