
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
    
    RCTComponentEvent *cEvent = [[RCTComponentEvent alloc] initWithName:@"topChange"
                                                             viewTag:shineButton.reactTag
                                                                body:event];
    [self.bridge.eventDispatcher sendEvent:cEvent];
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
    view.color = [RNImageHelper ColorFromHexCode: json];
}

RCT_CUSTOM_VIEW_PROPERTY(fillColor, NSString *, WCLShineButton) {
    view.fillColor = [RNImageHelper ColorFromHexCode: json];
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
        drawable = [RNImageHelper GenerateImage: json];
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

@end
  
