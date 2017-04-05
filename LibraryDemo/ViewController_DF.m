//
//  ViewController.m
//  LibraryDemo
//
//  Created by vee on 2017/4/1.
//  Copyright © 2017年 None. All rights reserved.
//

#import "ViewController.h"
#import <DyFrameWork/DemoViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)someAction:(id)sender
{
    NSBundle *bundle = [NSBundle bundleForClass:[DemoViewController class]];
    
    DemoViewController *dvc = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:bundle];
    [self presentViewController:dvc animated:YES completion:^{
        
    }];
}


@end
