
#import "RNShineButton.h"


@implementation RNShineButton

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    WCLShineButton *shineButton = [recognizer view];
    [shineButton touchesEnded:nil withEvent: nil];

    NSDictionary *event = @{
        @"target": shineButton.reactTag,
        @"value": @([shineButton isSelected]),
        @"name": @"tap",
    };
    [self.bridge.eventDispatcher sendInputEventWithName:@"topChange" body:event];
}

- (UIView *)view
{
    WCLShineButton *shineButton = [[WCLShineButton alloc] initWithFrame: CGRectMake(100, 100, 60, 60)];

    UITapGestureRecognizer *singleTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    [shineButton addGestureRecognizer: singleTap];
    
    return shineButton;
}

RCT_CUSTOM_VIEW_PROPERTY(color, NSString *, WCLShineButton)
{
    view.color = [RNShineButton colorFromHexCode: json];
}

RCT_CUSTOM_VIEW_PROPERTY(fillColor, NSString *, WCLShineButton)
{
    view.fillColor = [RNShineButton colorFromHexCode: json];
}

RCT_CUSTOM_VIEW_PROPERTY(disabled, BOOL, WCLShineButton)
{

}

RCT_CUSTOM_VIEW_PROPERTY(shape, NSString *, WCLShineButton)
{
    if ([json isEqualToString:@"heart"]) {
        view.image = @".heart";
    } else if ([json isEqualToString:@"like"]) {
        view.image = @".like";
    } else if ([json isEqualToString:@"smile"]) {
        view.image = @".smile";
    } else if ([json isEqualToString:@"star"]) {
        view.image = @".star";
    }
}


RCT_CUSTOM_VIEW_PROPERTY(size, NSInteger *, WCLShineButton)
{
    float size = [json floatValue];
    float increaseSize = size * 40 / 100;
    
//    [view setFrame: CGRectMake(increaseSize + size, increaseSize + size, size, size)];
}

+ (UIColor *) colorFromHexCode:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
  
