//
//  ViewController.m
//  RunningLED
//
//  Created by Văn Tiến Tú on 7/28/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin;
    CGFloat _ballDiameter;
    int _numberOfBall;
    int _timer;
    int _ledON;
    int _ledON2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _margin=40;
    _numberOfBall=8;
    _ballDiameter=32;
    _ledON=_numberOfBall;
    _ledON2=-1;
    [self DrawnumberOfBalls: _numberOfBall andY:100];
    //[self atX:100 andY:100 withTag:1];
    _timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLED) userInfo:nil repeats:true];
   //_timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLED2) userInfo:nil repeats:true];
}
-(void) runningLED2{
    if(_ledON!=-1){
        [self turnOfLed:_ledON];
    }
    if(_ledON!=_numberOfBall-1){
        _ledON++;
    }else{
        _ledON=0;
    }
    [self turnOnLed:_ledON];
}
-(void) runningLED{
    if(_ledON!=_numberOfBall){
        [self turnOfLed:_ledON];
    }
    if (_ledON!=0) {
        _ledON--;
    }else{
        _ledON=_numberOfBall-1;
    }
    [self turnOnLed:_ledON];
    
    
    
    if(_ledON2!=-1){
        [self turnOfLed:_ledON2];
    }
    if(_ledON2!=_numberOfBall-1){
        _ledON2++;
    }else{
        _ledON2=0;
    }
    [self turnOnLed:_ledON2];
    
    
    
}
-(void) turnOnLed:(int) index{
    UIView *view=[self.view viewWithTag:index+100];
    if (view && [view isMemberOfClass:[UIImageView class]]) {
        UIImageView* ball=(UIImageView*) view;
        ball.image=[UIImage imageNamed:@"green"];
    }
}
-(void) turnOfLed: (int) index{
    UIView *view=[self.view viewWithTag:index+100];
    if (view && [view isMemberOfClass:[UIImageView class]]) {
        UIImageView* ball=(UIImageView*) view;
        ball.image=[UIImage imageNamed:@"grey"];
    }
}
-(void) atX: (CGFloat) x andY: (CGFloat)y withTag: (int) tag{
    UIImageView *ball=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grey"]];
    ball.center=CGPointMake(x, y);
    ball.tag=tag;
    [self.view addSubview:ball ];
}
-(CGFloat) spaceBetweenBallandSpace: (int) n{
    return (self.view.bounds.size.width-2*_margin)/(n-1);
}
-(void) DrawnumberOfBalls: (int) n andY:(CGFloat)y{
    CGFloat space=[self spaceBetweenBallandSpace:n];
    
        for (int i=0; i<n; i++) {
            [self atX:_margin+i*space
                 andY:y
              withTag:i+100];
        }
    
}
@end









