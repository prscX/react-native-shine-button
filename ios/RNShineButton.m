
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

- (WCLShineButton *)view {
    WCLShineButton *shineButton = [[WCLShineButton alloc] init];

    UITapGestureRecognizer *singleTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    [shineButton addGestureRecognizer: singleTap];
    
    return shineButton;
}


RCT_CUSTOM_VIEW_PROPERTY(size, NSInteger *, WCLShineButton) {
    view.frame = CGRectMake(0, 0, [json floatValue], [json floatValue]);
    [view initLayers];
}

RCT_CUSTOM_VIEW_PROPERTY(color, NSString *, WCLShineButton) {
    view.color = [RNShineButton colorFromHexCode: json];
}

RCT_CUSTOM_VIEW_PROPERTY(fillColor, NSString *, WCLShineButton) {
    view.fillColor = [RNShineButton colorFromHexCode: json];
}

RCT_CUSTOM_VIEW_PROPERTY(value, NSInteger *, WCLShineButton) {
    if ([json boolValue] == YES) {
        [view setSelected: YES];
    } else {
        [view setSelected: NO];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(shape, NSDictonary *, WCLShineButton) {
    NSString *shape;
    UIImage *drawable;

    if (![json objectForKey: @"shape"]) {
        drawable = [self generateVectorIcon: json];
        shape = [json objectForKey: @"name"];
    } else {
        shape = [json objectForKey: @"shape"];
    }
    
    if ([shape isEqualToString:@"heart"]) {
        view.image = @".heart";
    } else if ([shape isEqualToString:@"like"]) {
        view.image = @".like";
    } else if ([shape isEqualToString:@"smile"]) {
        view.image = @".smile";
    } else if ([shape isEqualToString:@"star"]) {
        view.image = @".star";
    } else {
        if (drawable != nil) {
            view.customImage = drawable;
        }
    }
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
  
