//
//  DismissAnimator.m
//  iOSTransition
//
//  Created by AdminZhiHua on 16/6/1.
//  Copyright © 2016年 AdminZhiHua. All rights reserved.
//

#import "DismissAnimator.h"
#import "PresentViewController.h"
#import "DismissViewController.h"

@implementation DismissAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    DismissViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UINavigationController *toNav = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    PresentViewController *toVC = (PresentViewController *)toNav.topViewController;
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    UIView *dummyView = [fromVC.imageView snapshotViewAfterScreenUpdates:YES];
    
    dummyView.frame = [containerView convertRect:fromVC.imageView.frame fromView:fromVC.view];
    
    [containerView addSubview:dummyView];
    
    fromVC.imageView.hidden = YES;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        CGRect frame = [containerView convertRect:toVC.imageView.frame fromView:toVC.containView];
        dummyView.frame = frame;
        
    } completion:^(BOOL finished) {
        
        fromVC.imageView.hidden = NO;
        [dummyView removeFromSuperview];
        
        BOOL isCancel = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancel];
        
    }];
}

- (void)dealloc {
    NSLog(@"++++");
}

@end
