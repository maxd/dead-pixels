#import "MoireStrategy.h"
#import "ColorItem.h"

@implementation MoireStrategy

- (id)init {
    self = [super init];
    if (self) {
        colorItems = [NSArray arrayWithObjects:
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BlackWhite"]] colorName:@"Black & White"],
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"WhiteBlack"]] colorName:@"White & Black"],
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BlueYellow"]] colorName:@"Blue & Yellow"],
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"YellowBlue"]] colorName:@"Yellow & Blue"],
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"CyanRed"]] colorName:@"Cyan & Red"],
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"RedCyan"]] colorName:@"Red & Cyan"],
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"GreenMagenta"]] colorName:@"Green & Magenta"],
                        [ColorItem colorItemWithColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MagentaGreen"]] colorName:@"Magenta & Green"],
                        nil
        ];
    }
    return self;
}

@end
