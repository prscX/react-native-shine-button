
#import "RNShineButton.h"

@implementation RNShineButton

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

- (UIView *)view
{
    WCLShineButton *shineButton = [[WCLShineButton alloc] initWithFrame: CGRectMake(100, 100, 60, 60)];
    
    return shineButton;
}

@end
  
