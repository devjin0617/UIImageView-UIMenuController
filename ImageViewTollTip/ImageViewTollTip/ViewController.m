//
//  ViewController.m
//  ImageViewTollTip
//
//  Created by jin on 2015. 10. 13..
//  Copyright (c) 2015년 jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILongPressGestureRecognizer *gr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
//    UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    [self.testImageView setUserInteractionEnabled:YES];
    [self.testImageView addGestureRecognizer:gr];
//    [self.testButton addGestureRecognizer:gr];
//    [self.testLabel addGestureRecognizer:gr];
    
}

- (void) longPress:(UILongPressGestureRecognizer *) gestureRecognizer {
    NSLog(@"longPress");
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        CGPoint location = [gestureRecognizer locationInView:[gestureRecognizer view]];
        CGRect rect = [gestureRecognizer view].frame;
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *resetMenuItem = [[UIMenuItem alloc] initWithTitle:@"Item" action:@selector(menuItemClicked:)];
        
        NSAssert([self becomeFirstResponder], @"Sorry, UIMenuController will not work with %@ since it cannot become first responder", self);
        [menuController setMenuItems:[NSArray arrayWithObject:resetMenuItem]];
//        [menuController setTargetRect:CGRectMake(location.x, location.y, 0.0f, 0.0f) inView:[gestureRecognizer view]];
        [menuController setTargetRect:CGRectMake(rect.size.width/2, 10.f, 0.0f, 0.0f) inView:[gestureRecognizer view]];
        [menuController setMenuVisible:YES animated:YES];
    }
}

- (void) copy:(id) sender {
    // called when copy clicked in menu
}

- (void) menuItemClicked:(id) sender {
    // called when Item clicked in menu
}

- (BOOL) canPerformAction:(SEL)selector withSender:(id) sender {
    NSLog(@"canPerformAction");
    if (selector == @selector(menuItemClicked:) || selector == @selector(copy:)) {
        return YES;
    }
    return NO;
}

- (BOOL) canBecomeFirstResponder {
    NSLog(@"canBecomeFirstResponder");
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
