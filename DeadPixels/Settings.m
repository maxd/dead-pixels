#import "Settings.h"

#define TEST_VIEW_NULL_SCREEN @"TEST_VIEW_NULL_SCREEN"

@implementation Settings {
    NSUserDefaults *userDefaults;
}

static Settings *settings = nil;

- (id)init
{
    self = [super init];

    if (self) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }

    return self;
}

+ (Settings *)shared {
    if (settings == nil) {
        settings = [Settings new];
    }
    return settings;
}

- (BOOL)canShowTestViewNullScreen {
    return ![[userDefaults objectForKey:TEST_VIEW_NULL_SCREEN] boolValue];
}

- (void)markTestViewNullScreen {
    [userDefaults setBool:YES forKey:TEST_VIEW_NULL_SCREEN];
    [userDefaults synchronize];
}


@end
