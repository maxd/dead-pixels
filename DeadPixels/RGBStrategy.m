#import "RGBStrategy.h"
#import "ColorItem.h"

@implementation RGBStrategy

- (id)init {
    self = [super init];
    if (self) {
        colorItems = [NSArray arrayWithObjects:
                        [ColorItem colorItemWithColor:[UIColor redColor] colorName:@"Red"],
                        [ColorItem colorItemWithColor:[UIColor greenColor] colorName:@"Green"],
                        [ColorItem colorItemWithColor:[UIColor blueColor] colorName:@"Blue"],
                        nil
        ];
    }
    return self;
}

@end
