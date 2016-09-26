//
//  UITextView+PlaceHolder.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "UITextView+PlaceHolder.h"

static UITextView *_placeHolderTextView;
@implementation UITextView (PlaceHolder)

- (UITextView *)placeHolderTextView {
    
    return objc_getAssociatedObject(self, (__bridge const void *)(_placeHolderTextView));
}

- (void)setPlaceHolderTextView:(UITextView *)placeHolderTextView {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_placeHolderTextView), placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addPlaceHolder:(NSString *)placeHolder {
    
    if (![self placeHolderTextView]) {
        
        self.delegate = self;
        _placeHolderTextView = [[UITextView alloc] initWithFrame:self.bounds];
        _placeHolderTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _placeHolderTextView.font = self.font;
        _placeHolderTextView.backgroundColor = [UIColor clearColor];
        _placeHolderTextView.textColor = [UIColor grayColor];
        _placeHolderTextView.userInteractionEnabled = NO;
        _placeHolderTextView.text = placeHolder;
        [self addSubview:_placeHolderTextView];
        [self setPlaceHolderTextView:_placeHolderTextView];
    }
}

# pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    
    if (textView.text.length > 0) {
        
        self.placeHolderTextView.hidden = YES;
    } else {
        
        self.placeHolderTextView.hidden = NO;
    }
}


@end
