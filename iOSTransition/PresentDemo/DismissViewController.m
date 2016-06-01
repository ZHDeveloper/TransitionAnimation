//
//  DismissViewController.m
//  iOSTransition
//
//  Created by AdminZhiHua on 16/6/1.
//  Copyright © 2016年 AdminZhiHua. All rights reserved.
//

#import "DismissViewController.h"
#import "PresentAnimator.h"
#import "DismissAnimator.h"

@interface DismissViewController () <UIViewControllerTransitioningDelegate>


@end

@implementation DismissViewController

- (instancetype)init {
    if ([super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [UIImageView new];
    self.imageView.frame = CGRectMake(0, 0, 200, 200);
    self.imageView.center = self.view.center;
    
    [self.view addSubview:self.imageView];
    
    self.imageView.image = [UIImage imageNamed:@"mojiezuo.jpg"];
    
    self.imageView.layer.cornerRadius = 100;
    self.imageView.layer.masksToBounds = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [PresentAnimator new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    return [DismissAnimator new];
}

@end
