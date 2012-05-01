#import <Foundation/Foundation.h>
#import "Strategy.h"

@interface SwitchColorsStrategy : NSObject <Strategy> {

@protected
    NSArray *colorItems;
}

@end
