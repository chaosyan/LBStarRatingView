//
//  LBViewController.m
//  LBStarRatingViewDemo
//
//  Created by 闫 超杰 on 29/6/14.
//  Copyright (c) 2014年 Labin. All rights reserved.
//

#import "LBViewController.h"
#import "LBStarRatingView.h"

@interface LBViewController ()

@end

@implementation LBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LBStarRatingView *starRatingView = [[LBStarRatingView alloc] initWithFrame:CGRectMake(20, 100, 250, 50) numberOfStar:5];
    starRatingView.delegate = self;
    starRatingView.changeNode = 3;
    [self.view addSubview:starRatingView];
}

-(void)starRatingView:(LBStarRatingView *)view score:(CGFloat)score
{
    _scorelabel.text = [NSString stringWithFormat:@"%0.2f",score * 10 ];
}

@end
