//
//  LBViewController.h
//  LBStarRatingViewDemo
//
//  Created by 闫 超杰 on 29/6/14.
//  Copyright (c) 2014年 Labin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol StarRatingViewDelegate;
@interface LBViewController : UIViewController<StarRatingViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *scorelabel;

@end
