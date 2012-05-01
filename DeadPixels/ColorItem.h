#import <Foundation/Foundation.h>

@interface ColorItem : NSObject

@property (strong) UIColor *color;
@property (strong) NSString *colorName;

+ (ColorItem *)colorItemWithColor:(UIColor *)color colorName:(NSString *)colorName;

@end
