//
//  TTActionSheet.h
//  TTBasicProject
//
//  Created by 赵春浩 on 16/9/18.
//  Copyright © 2016年 Mr Zhao. All rights reserved.
//

#import "TTActionSheet.h"

@implementation TTActionSheet {
    
    UIActionSheet * _actionSheet;
    NSInteger _selectedIndex;
}

@synthesize titles = _titles;
@synthesize destructiveButtonIndex = _destructiveButtonIndex;
@synthesize cancelButtonIndex = _cancelButtonIndex;

- (id)initWithTitles:(NSArray *)titles {
    
    self = [super init];
    if (self) {
        _titles = titles;
        _destructiveButtonIndex = 0;
        _cancelButtonIndex = titles.count - 1;
    }
    return self;
}

- (void)setTitles:(NSArray *)titles {
    
    _titles = titles;
    _cancelButtonIndex = titles.count - 1;
}

- (NSInteger)showInView:(UIView *)view {
    
    _actionSheet = [[UIActionSheet alloc] init];
    
    // it seems not work, if no delegate set.
    //_actionSheet.title = @"add a title would be better.";
    _actionSheet.delegate = self;
    
    for (NSString * title in _titles) {
        
        [_actionSheet addButtonWithTitle:title];
    }
    if (_destructiveButtonIndex != -1) {
        
        _actionSheet.destructiveButtonIndex = _destructiveButtonIndex;
    }
    if (_cancelButtonIndex != -1) {
        
        _actionSheet.cancelButtonIndex = _cancelButtonIndex;
    }
    
    [_actionSheet showInView:view];
    CFRunLoopRun();
    
    return _selectedIndex;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    _selectedIndex = buttonIndex;
    _actionSheet = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
}


@end
