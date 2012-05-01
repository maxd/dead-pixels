#import <Foundation/Foundation.h>

@interface Settings : NSObject

+ (Settings *)shared;

- (BOOL)canShowTestViewNullScreen;
- (void)markTestViewNullScreen;

@end
