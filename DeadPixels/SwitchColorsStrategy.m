#import "SwitchColorsStrategy.h"
#import "ColorItem.h"

@implementation SwitchColorsStrategy {
    int currentColorIndex;
}

- (id)init {
    self = [super init];
    if (self) {
        currentColorIndex = 0;
    }
    return self;
}

- (ColorItem *)colorItem
{
    return [colorItems objectAtIndex:(NSUInteger) currentColorIndex];
}

- (void)nextColor
{
    currentColorIndex++;
    if (currentColorIndex > colorItems.count - 1)
        currentColorIndex = 0;
}

- (void)prevColor
{
    currentColorIndex--;
    if (currentColorIndex < 0)
        currentColorIndex = colorItems.count - 1;
}

@end
