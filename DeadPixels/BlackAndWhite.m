#import "BlackAndWhite.h"
#import "ColorItem.h"

@implementation BlackAndWhite

- (id)init {
    self = [super init];
    if (self) {
        colorItems = [NSArray arrayWithObjects:
                        [ColorItem colorItemWithColor:[UIColor whiteColor] colorName:@"White"],
                        [ColorItem colorItemWithColor:[UIColor blackColor] colorName:@"Black"],
                        nil
        ];
    }
    return self;
}

@end
