
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
    BOOL selection = [shineButton getSelection];
    
    NSDictionary *event = @{
        @"target": shineButton.reactTag,
        @"value": selection ? @"YES" : @"NO",
        @"name": @"tap",
    };
    [self.bridge.eventDispatcher sendInputEventWithName:@"topChange" body:event];
}

- (UIView *)view
{
    UIView *view = [[UIView alloc] init];
    return view;
}

RCT_CUSTOM_VIEW_PROPERTY(props, NSDictonary *, UIView)
{
    NSString *size = [json objectForKey: @"size"];
    NSString *color = [json objectForKey: @"color"];
    NSString *fillColor = [json objectForKey: @"fillColor"];

    NSDictionary *shapeProps = [json objectForKey: @"shape"];
    NSString *disabled = [json objectForKey: @"disabled"];
    NSNumber *on = [json objectForKey: @"on"];
    
    WCLShineButton *shineButton = [[WCLShineButton alloc] initWithFrame: CGRectMake(0, 0, [size floatValue], [size floatValue])];
    shineButton.color = [RNShineButton colorFromHexCode: color];
    shineButton.fillColor = [RNShineButton colorFromHexCode: fillColor];
    shineButton.reactTag = view.reactTag;
    
    NSString *shape;
    UIImage *drawable;
    if (![shapeProps objectForKey: @"shape"]) {
        drawable = [self generateVectorIcon: shapeProps];
        shape = [shapeProps objectForKey: @"name"];
    } else {
        shape = [shapeProps objectForKey: @"shape"];
    }
    
    if ([shape isEqualToString:@"heart"]) {
        shineButton.image = @".heart";
    } else if ([shape isEqualToString:@"like"]) {
        shineButton.image = @".like";
    } else if ([shape isEqualToString:@"smile"]) {
        shineButton.image = @".smile";
    } else if ([shape isEqualToString:@"star"]) {
        shineButton.image = @".star";
    } else {
        if (drawable != nil) {
            shineButton.customImage = drawable;
        }
    }

    if ([on boolValue] == YES) {
        [shineButton setSelected: YES];
    }
    
    UITapGestureRecognizer *singleTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    [shineButton addGestureRecognizer: singleTap];
    
    [view addSubview: shineButton];
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


- (UIImage *) generateVectorIcon: (NSDictionary *) icon {
    NSString *family = [icon objectForKey: @"family"];
    NSString *name = [icon objectForKey: @"name"];
    NSString *glyph = [icon objectForKey: @"glyph"];
    NSNumber *size = [icon objectForKey: @"size"];
    NSString *color = [icon objectForKey: @"color"];
    
    UIColor *uiColor = [RNShineButton colorFromHexCode: color];
    CGFloat screenScale = RCTScreenScale();
    
    UIFont *font = [UIFont fontWithName:family size:[size floatValue]];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:glyph attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: uiColor}];
    
    CGSize iconSize = [attributedString size];
    UIGraphicsBeginImageContextWithOptions(iconSize, NO, 0.0);
    [attributedString drawAtPoint:CGPointMake(0, 0)];
    
    UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return iconImage;
}

@end
  
