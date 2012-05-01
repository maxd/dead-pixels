#import "TestViewController.h"
#import "Strategy.h"
#import "ColorItem.h"
#import <QuartzCore/QuartzCore.h>
#import "Settings.h"

@interface TestViewController () {
    IBOutlet UILabel *colorNameLabel;
    IBOutlet UIView *nullScreenPlaceholder;
    
    id<Strategy> strategy;
    
    UISwipeGestureRecognizer *swipeLeftGestureRecognizer;
    UISwipeGestureRecognizer *swipeRightGestureRecognizer;
    
    UITapGestureRecognizer *tapGestureRecognizer;
}

@end

@implementation TestViewController

- (id)initWithStrategy:(id<Strategy>)_strategy {
    self = [super init];
    if (self) {
        strategy = _strategy;
        
        [self initGestureRecognizers];
    }
    return self;
}

- (void)initGestureRecognizers
{
    swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftGestureRecognizer];

    swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightGestureRecognizer];
    
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark ViewController Handlers

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    colorNameLabel.layer.cornerRadius = 5;
    nullScreenPlaceholder.layer.cornerRadius = 5;

    // Fix problem with animation in viewDidLoad: http://stackoverflow.com/questions/4007023/blocks-instead-of-performselectorwithobjectafterdelay 
    [UIView animateWithDuration:0 delay:0.1 options:UIViewAnimationOptionAllowUserInteraction animations:^{} completion:^(BOOL finished){
        [self setColorItem:[strategy colorItem]];

        if (![[Settings shared] canShowTestViewNullScreen]) {
            nullScreenPlaceholder.hidden = YES;
        } else {
            nullScreenPlaceholder.hidden = NO;
            [[Settings shared] markTestViewNullScreen];
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark Gesture Recognizer Handlers

- (void)swipeHandler:(UISwipeGestureRecognizer *)source
{
    if (source == swipeLeftGestureRecognizer) {
        [self switchToNextColor];
    }
    
    if (source == swipeRightGestureRecognizer) {
        [self switchToPrevColor];
    }
}

- (void)tapHandler:(UITapGestureRecognizer *)source
{
    CGPoint point = [source locationInView:self.view];
    
    if (point.x < self.view.frame.size.width * 0.2) {
        [self switchToPrevColor];
    } else if (point.x > self.view.frame.size.width * 0.8) {
        [self switchToNextColor];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
}

#pragma mark Controller Logic

- (void)switchToNextColor
{
    [strategy nextColor];
    [self setColorItem:[strategy colorItem]];
}

- (void)switchToPrevColor
{
    [strategy prevColor];
    [self setColorItem:[strategy colorItem]];
}

- (void)setColorItem:(ColorItem *)colorItem
{
    self.view.backgroundColor = colorItem.color;
    colorNameLabel.text = colorItem.colorName;

    nullScreenPlaceholder.hidden = YES;
    
    colorNameLabel.alpha = 1;
    [UIView beginAnimations:@"ColorName" context:@"ColorNameContext"];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:1];

    colorNameLabel.alpha = 0;
    
    [UIView commitAnimations];
}

@end
