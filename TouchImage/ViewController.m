//
//  ViewController.m
//  TouchImage
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ballImage;

@end

@implementation ViewController {
    BOOL holdingImage;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(self.ballImage.frame, point)) {
        holdingImage = YES;
        self.ballImage.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"moved count:%d", [[event allTouches] count]);
    
    if (holdingImage) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        self.ballImage.center = point;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (holdingImage) {
        self.ballImage.transform = CGAffineTransformIdentity;
        holdingImage = NO;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
