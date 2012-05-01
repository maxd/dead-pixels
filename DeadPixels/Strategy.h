#import <Foundation/Foundation.h>

@class ColorItem;

@protocol Strategy <NSObject>

-(ColorItem *)colorItem;

-(void)nextColor;
-(void)prevColor;

@end
