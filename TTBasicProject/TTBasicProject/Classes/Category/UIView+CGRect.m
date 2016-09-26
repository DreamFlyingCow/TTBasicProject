//
//  UIView+CGRect.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/26.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "UIView+CGRect.h"

CGPoint CGRectGetCenter(CGRect rect) {
    
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center) {
    
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x - CGRectGetMidX(rect);
    newrect.origin.y = center.y - CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

@implementation UIView (CGRect)

#pragma mark - 设置frame的origin
- (CGPoint)origin {
    
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)aPoint {
    
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}


#pragma mark - 设置frame的size
- (CGSize)size {
    
    return self.frame.size;
}

- (void)setSize:(CGSize)aSize {
    
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

#pragma mark - 获取右下 左下 右上三个点的坐标(只能获取, 不能设置, 坐上就是frame.origin)
- (CGPoint)bottomRight {
    
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)bottomLeft {
    
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)topRight {
    
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

#pragma mark - 设置上下左右还有宽高
- (CGFloat)height {
    
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newheight {
    
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat)width {
    
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newwidth {
    
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat)top {
    
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newtop {
    
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat)left{
    
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)newleft {
    
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat)bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)newbottom {
    
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)right {
    
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)newright {
    
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

#pragma mark - 移动, center的point沿着参数移动
- (void)moveBy:(CGPoint)delta {
    
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

#pragma mark - 缩放, 整体的size会根据参数进行等比例的缩放
- (void)scaleBy:(CGFloat)scaleFactor {
    
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

#pragma mark - 只能进行缩小(保证与原图等比例, 会根据参数中长宽较小的那个进行缩放)
- (void)fitInSize:(CGSize)aSize {
    
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height)) {
        
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width > aSize.width)) {
        
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;	
}

@end
