//
//  PopAnimator.h
//  iOSTransition
//
//  Created by AdminZhiHua on 16/6/1.
//  Copyright © 2016年 AdminZhiHua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PopAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,strong) id<UIViewControllerContextTransitioning>transitionContext;

@end
