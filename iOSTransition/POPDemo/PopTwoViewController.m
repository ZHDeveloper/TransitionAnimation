//
//  PopTwoViewController.m
//  iOSTransition
//
//  Created by AdminZhiHua on 16/6/1.
//  Copyright © 2016年 AdminZhiHua. All rights reserved.
//

#import "PopTwoViewController.h"

@interface PopTwoViewController ()

@end

@implementation PopTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
