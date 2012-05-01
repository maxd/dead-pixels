#import "ColorItem.h"

@implementation ColorItem

@synthesize color = _color;
@synthesize colorName = _colorName;

+ (ColorItem *)colorItemWithColor:(UIColor *)color colorName:(NSString *)colorName
{
    ColorItem *colorItem = [ColorItem new];

    colorItem.color = color;
    colorItem.colorName = colorName;

    return colorItem;
}

@end
