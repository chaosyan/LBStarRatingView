//
//  LBStarRatingView.m
//  LBStarRatingViewDemo
//
//  Created by 闫 超杰 on 29/6/14.
//  Copyright (c) 2014年 Labin. All rights reserved.
//

#import "LBStarRatingView.h"

@interface LBStarRatingView () {
    
    BOOL        _exchanged1;
    BOOL        _exchanged2;
    
    NSInteger   a;
    
    CGFloat     _exchangedNode;
}

@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) UIView *starForegroundView;

@end

@implementation LBStarRatingView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStar:5];
}

- (id)initWithFrame:(CGRect)frame numberOfStar:(NSUInteger)number
{
    self = [super initWithFrame:frame];
    if (self) {
     
        _numberOfStar = number;
        self.starBackgroundView = [self buidlStarViewWithImageName:@"backgroundStar"];
        self.starForegroundView = [self buidlStarViewWithImageName:@"darkbackgroundStar"];
        
        [self addSubview:self.starBackgroundView];
        [self addSubview:self.starForegroundView];
    }
    
    return self;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if(CGRectContainsPoint(rect,point))
    {
        [self changeStarForegroundViewWithPoint:point];
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    __weak typeof(self) weekSelf = self;
    [UIView transitionWithView:_starForegroundView
                      duration:0.2
                       options:UIViewAnimationOptionCurveEaseInOut
                    animations:^
     {
         [weekSelf changeStarForegroundViewWithPoint:point];
     }
                    completion:^(BOOL finished)
     {
         
     }];
}

- (UIView *)buidlStarViewWithImageName:(NSString *)imageName
{
    CGRect frame = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.clipsToBounds = YES;
    for (int i = 0; i < _numberOfStar; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * frame.size.width / _numberOfStar, 0, frame.size.width / _numberOfStar, frame.size.height);
        [view addSubview:imageView];
    }
    return view;
}

- (void)exchangeImageWithName:(NSString *)newImageName{
    
    for (UIImageView *imageView in _starForegroundView.subviews) {
        imageView.image = [UIImage imageNamed:newImageName];
    }
    [_starForegroundView layoutSubviews];
    
    _exchanged1 = YES;
    _exchanged2 = YES;
}

- (void)changeStarForegroundViewWithPoint:(CGPoint)point
{
    CGPoint p = point;
    
    if (p.x < 0)
    {
        p.x = 0;
    }
    else if (p.x > self.frame.size.width)
    {
        p.x = self.frame.size.width;
    }
    
    NSString * str = [NSString stringWithFormat:@"%0.2f",p.x / self.frame.size.width];
    float score = [str floatValue];
    
    if (_changeNode != 0 && score >= _exchangedNode) {
        if (!_exchanged1) {
            [self exchangeImageWithName:@"foregroundStar"];
            _exchanged2 = NO;
        }
    } else {
        if (!_exchanged2) {
            [self exchangeImageWithName:@"darkbackgroundStar"];
            _exchanged1 = NO;
        }
    }
    
    p.x = score * self.frame.size.width;
    _starForegroundView.frame = CGRectMake(0, 0, p.x, self.frame.size.height);
    
    if(_delegate && [_delegate respondsToSelector:@selector(starRatingView: score:)])
    {
        [_delegate starRatingView:self score:score];
    }
    
}

- (void)setChangeNode:(CGFloat)changeNode{
    _changeNode = changeNode;
    _exchangedNode =  _changeNode/_numberOfStar;
}

@end
