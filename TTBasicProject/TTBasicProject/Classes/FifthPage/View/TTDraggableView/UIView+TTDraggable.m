//
//  UIView+TTDraggable.m
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "UIView+TTDraggable.h"
#import <objc/runtime.h>

@implementation UIView (TTDraggable)

- (void)makeDraggable {
    
    NSAssert(self.superview, @"Super view is required when make view draggable");
    [self makeDraggableInView:self.superview damping:0.4];
}

- (void)makeDraggableInView:(UIView *)view damping:(CGFloat)damping {
    
    if (!view) return;
    [self removeDraggable];
    
    self.tt_playground = view;
    self.tt_damping = damping;
    
    [self tt_creatAnimator];
    [self tt_addPanGesture];
}

- (void)removeDraggable {
    
    [self removeGestureRecognizer:self.tt_panGesture];
    self.tt_panGesture = nil;
    self.tt_playground = nil;
    self.tt_animator = nil;
    self.tt_snapBehavior = nil;
    self.tt_attachmentBehavior = nil;
    self.tt_centerPoint = CGPointZero;
}

- (void)updateSnapPoint {
    
    self.tt_centerPoint = [self convertPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) toView:self.tt_playground];
    self.tt_snapBehavior = [[UISnapBehavior alloc] initWithItem:self snapToPoint:self.tt_centerPoint];
    self.tt_snapBehavior.damping = self.tt_damping;
}

- (void)tt_creatAnimator {
    
    self.tt_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.tt_playground];
    [self updateSnapPoint];
}

- (void)tt_addPanGesture {
    
    self.tt_panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tt_panGesture:)];
    [self addGestureRecognizer:self.tt_panGesture];
}

#pragma mark - Gesture

- (void)tt_panGesture:(UIPanGestureRecognizer *)pan {
    
    CGPoint panLocation = [pan locationInView:self.tt_playground];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        UIOffset offset = UIOffsetMake(panLocation.x - self.tt_centerPoint.x, panLocation.y - self.tt_centerPoint.y);
        [self.tt_animator removeAllBehaviors];
        self.tt_attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self offsetFromCenter:offset attachedToAnchor:panLocation];
        [self.tt_animator addBehavior:self.tt_attachmentBehavior];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        
        [self.tt_attachmentBehavior setAnchorPoint:panLocation];
    } else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateFailed) {
        
        [self.tt_animator removeAllBehaviors];
        [self.tt_animator addBehavior:self.tt_snapBehavior];
    }
}

#pragma mark - Associated Object

- (void)setTt_playground:(id)object {
    
    objc_setAssociatedObject(self, @selector(tt_playground), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)tt_playground {
    
    return objc_getAssociatedObject(self, @selector(tt_playground));
}

- (void)setTt_animator:(id)object {
    
    objc_setAssociatedObject(self, @selector(tt_animator), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIDynamicAnimator *)tt_animator {
    
    return objc_getAssociatedObject(self, @selector(tt_animator));
}

- (void)setTt_snapBehavior:(id)object {
    
    objc_setAssociatedObject(self, @selector(tt_snapBehavior), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UISnapBehavior *)tt_snapBehavior {
    
    return objc_getAssociatedObject(self, @selector(tt_snapBehavior));
}

- (void)setTt_attachmentBehavior:(id)object {
    
    objc_setAssociatedObject(self, @selector(tt_attachmentBehavior), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIAttachmentBehavior *)tt_attachmentBehavior {
    
    return objc_getAssociatedObject(self, @selector(tt_attachmentBehavior));
}

- (void)setTt_panGesture:(id)object {
    
    objc_setAssociatedObject(self, @selector(tt_panGesture), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPanGestureRecognizer *)tt_panGesture {
    
    return objc_getAssociatedObject(self, @selector(tt_panGesture));
}

- (void)setTt_centerPoint:(CGPoint)point {
    
    objc_setAssociatedObject(self, @selector(tt_centerPoint), [NSValue valueWithCGPoint:point], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)tt_centerPoint {
    
    return [objc_getAssociatedObject(self, @selector(tt_centerPoint)) CGPointValue];
}

- (void)setTt_damping:(CGFloat)damping {
    
    objc_setAssociatedObject(self, @selector(tt_damping), @(damping), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)tt_damping {
    
    return [objc_getAssociatedObject(self, @selector(tt_damping)) floatValue];
}

@end
