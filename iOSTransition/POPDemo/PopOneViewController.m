//
//  PopOneViewController.m
//  iOSTransition
//
//  Created by AdminZhiHua on 16/6/1.
//  Copyright © 2016年 AdminZhiHua. All rights reserved.
//

#import "PopOneViewController.h"
#import "PopTwoViewController.h"
#import "PopAnimator.h"

#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)

@interface PopOneViewController ()<UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *redView;

@property (nonatomic,strong) UIPercentDrivenInteractiveTransition *interTransition;

@end

@implementation PopOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    UIScreenEdgePanGestureRecognizer *panGest = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    panGest.edges = UIRectEdgeRight;
    
    [self.view addGestureRecognizer:panGest];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    
//    animation.keyPath = @"transform.rotation.y";
//    animation.duration = 0.7;
//    animation.fromValue = @(DEGREES_TO_RADIANS(180));
//    animation.toValue = @(0);
//    
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
//    
//    [self.redView.layer addAnimation:animation forKey:nil];
    
//    PopTwoViewController *vc = [PopTwoViewController new];
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)panAction:(UIScreenEdgePanGestureRecognizer *)panGest {
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    
    CGPoint location = [panGest translationInView:self.view];
    CGFloat progress = -1*(location.x)/width;
    
    NSLog(@"%lf",progress);
    
    switch (panGest.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            
            PopTwoViewController *vc = [PopTwoViewController new];
        
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case UIGestureRecognizerStateChanged:
            NSLog(@"%lf",progress);
            [self.interTransition updateInteractiveTransition:progress];
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            
            if (progress>0.5) {
                [self.interTransition finishInteractiveTransition];
            }
            else
            {
                [self.interTransition cancelInteractiveTransition];
            }
            
            self.interTransition = nil;
            
            break;

        default:
            break;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush)
    {
        return [PopAnimator new];
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interTransition;
}

@end
