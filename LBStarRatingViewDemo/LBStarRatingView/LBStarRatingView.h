//
//  LBStarRatingView.h
//  LBStarRatingViewDemo
//
//  Created by 闫 超杰 on 29/6/14.
//  Copyright (c) 2014年 Labin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LBStarRatingView;

@protocol StarRatingViewDelegate <NSObject>

@optional
-(void)starRatingView:(LBStarRatingView *)view score:(CGFloat)score;

@end

@interface LBStarRatingView : UIView

- (id)initWithFrame:(CGRect)frame numberOfStar:(NSUInteger)number;

@property (nonatomic, readonly) NSUInteger numberOfStar;
@property (nonatomic, weak) id <StarRatingViewDelegate> delegate;

/**
 *  Description 当达到这个值时 换成一种图片显示  当为0f 时 不用替换图片显示
 *  此值 不能大于 numberOfStar
 */
@property (nonatomic, assign)   CGFloat changeNode;

@end
