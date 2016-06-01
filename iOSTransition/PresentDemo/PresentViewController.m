//
//  PresentViewController.m
//  iOSTransition
//
//  Created by AdminZhiHua on 16/6/1.
//  Copyright © 2016年 AdminZhiHua. All rights reserved.
//

#import "PresentViewController.h"
#import "DismissViewController.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonAction:)];
    
    [self.imageView addGestureRecognizer:tapGest];
}

- (IBAction)buttonAction:(id)sender {
    
    DismissViewController *vc = [DismissViewController new];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
