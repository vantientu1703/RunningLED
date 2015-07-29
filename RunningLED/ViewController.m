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
    NSTimer* _timer;
    int _ledON;
    int _ledON2;
    NSTimer* _timer2;
    int t;
    NSTimer* _t;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _margin=40;
    _ballDiameter=32;
    _ledON=-1;
    int soDong=10;
    int soCot=10;
    _numberOfBall=soCot*soDong;
    _ledON2=_numberOfBall-1;
    [self themSodong:soDong atX:soCot toaDoY:50 withTag:100];
    _timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLED) userInfo:nil repeats:true];
    
}
-(void) themSodong: (int) x atX: (int) n toaDoY:(CGFloat) y withTag:(int) tag{
    for(int i=0;i<x;i++){
        [self DrawnumberOfBalls:n andY:y=y+50 withtag:i*x+tag];
    }
}
-(void) runningLED{
    if(_ledON!=-1){
        [self turnOfLed:_ledON];
    }
    if(_ledON!=_numberOfBall-1){
        _ledON++;
    }else{
        _ledON=0;
    }
    [self turnOnLed:_ledON];
    
    if(_ledON2!=_numberOfBall-1){
        [self turnOfLed:_ledON2];
    }
    if(_ledON2!=0){
        _ledON2--;
    }else{
        _ledON2=_numberOfBall-1;
    }
    [self turnOnLed:_ledON2];
}

-(void) turnOnLed:(int) index {
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
-(void) DrawnumberOfBalls: (int) n andY:(CGFloat)y withtag:(int) tag{
    CGFloat space=[self spaceBetweenBallandSpace:n];
    
        for (int i=0; i<n; i++) {
            [self atX:_margin+i*space
                 andY:y
              withTag:i+tag];
        }
}


@end









