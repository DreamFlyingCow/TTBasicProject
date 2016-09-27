//
//  UITextView+PlaceHolder.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "UITextView+PlaceHolder.h"

static const char *phTextView = "placeHolderTextView";
static id<UITextViewPlaceHolderDelegate> _placeHolderDelegate;

@implementation UITextView (PlaceHolder)

#pragma mark - 运行时处理分类中属性的getter以及setter方法
- (id<UITextViewPlaceHolderDelegate>)placeHolderDelegate {
    
    return objc_getAssociatedObject(self, (__bridge const void *)(_placeHolderDelegate));
}

- (void)setPlaceHolderDelegate:(id<UITextViewPlaceHolderDelegate>)placeHolderDelegate {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_placeHolderDelegate), placeHolderDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITextView *)placeHolderTextView {
    
    return objc_getAssociatedObject(self, phTextView);
}

- (void)setPlaceHolderTextView:(UITextView *)placeHolderTextView {
    
    objc_setAssociatedObject(self, phTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 添加占位字符串
- (void)addPlaceHolder:(NSString *)placeHolder {
    
    if (![self placeHolderTextView]) {
        
        // 添加观察者(注册监听)
        [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setPlaceHolderTextView:textView];
    }
}

#pragma mark - 处理属性改变事件(主要是用来解决对textView的text直接赋值问题)
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (((UITextView *)object).text.length > 0) {
        
        self.placeHolderTextView.hidden = YES;
    } else {
        
        self.placeHolderTextView.hidden = NO;
    }
}


# pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    if (textView.text.length > 0) {
        
        self.placeHolderTextView.hidden = YES;
    } else {
        
        self.placeHolderTextView.hidden = NO;
    }
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    // 这里是为了让调用者拿到编辑完成时的字符串来使用
    if ([self.placeHolderDelegate respondsToSelector:@selector(finishInputTextWithString:)]) {
        
        [self.placeHolderDelegate finishInputTextWithString:textView.text];
    }
}


@end
