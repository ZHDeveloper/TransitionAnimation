//
//  PresentAnimator.m
//  iOSTransition
//
//  Created by AdminZhiHua on 16/6/1.
//  Copyright © 2016年 AdminZhiHua. All rights reserved.
//

#import "PresentAnimator.h"
#import "PresentViewController.h"
#import "DismissViewController.h"

@implementation PresentAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UINavigationController *fromNav = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    PresentViewController *fromVC = (PresentViewController *)fromNav.topViewController;
    
    DismissViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    [containerView addSubview:toView];
    
    toVC.imageView.hidden = YES;
    
    UIView *dummyView = [fromVC.imageView snapshotViewAfterScreenUpdates:YES];
    
    CGRect frame = [containerView convertRect:fromVC.imageView.frame fromView:fromVC.containView];
    
    dummyView.frame = frame;
    
    [toView addSubview:dummyView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        CGRect frame = [containerView convertRect:toVC.imageView.frame toView:toView];
        
        dummyView.frame = frame;
        
    } completion:^(BOOL finished) {
        
        toVC.imageView.hidden = NO;
        [dummyView removeFromSuperview];
        
        BOOL isCancel = transitionContext.transitionWasCancelled;
        [transitionContext completeTransition:!isCancel];
    }];
    
}

@end
