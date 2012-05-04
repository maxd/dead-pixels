#import "MainViewController.h"
#import "TestViewController.h"
#import "RGBStrategy.h"
#import "BlackAndWhite.h"
#import "MoireStrategy.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController () {
    IBOutletCollection(UIButton) NSArray* buttons;
}

-(IBAction)blackAndWhiteButtonHandler;
-(IBAction)rgbButtonHandler;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];

    for (UIButton *button in buttons) {
        button.layer.cornerRadius = 5;
        button.layer.borderColor = [[UIColor blackColor] CGColor];
        button.layer.borderWidth = 1;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(IBAction)blackAndWhiteButtonHandler
{
    TestViewController *testViewController = [[TestViewController alloc] initWithStrategy:[BlackAndWhite new]];
    testViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentModalViewController:testViewController animated:YES];
}

-(IBAction)rgbButtonHandler
{
    TestViewController *testViewController = [[TestViewController alloc] initWithStrategy:[RGBStrategy new]];
    testViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentModalViewController:testViewController animated:YES];
}

-(IBAction)moireButtonHandler
{
    TestViewController *testViewController = [[TestViewController alloc] initWithStrategy:[MoireStrategy new]];
    testViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentModalViewController:testViewController animated:YES];
}

@end
