#import <UIKit/UIKit.h>

@protocol Strategy;

@interface TestViewController : UIViewController

- (id)initWithStrategy:(id<Strategy>)strategy;

@end
