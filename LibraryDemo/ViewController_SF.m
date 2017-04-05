//
//  ViewController.m
//  LibraryDemo
//
//  Created by vee on 2017/4/1.
//  Copyright © 2017年 None. All rights reserved.
//

#import "ViewController.h"
#import <StaticFW/DemoViewController.h>

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
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"Resource" ofType:@"bundle"]];
    
    UIImage *image1 = [UIImage imageNamed:@"cart" inBundle:bundle compatibleWithTraitCollection:nil];
    NSLog(@"image1:%@",image1);
    
    image1 = [UIImage imageNamed:@"arrow" inBundle:bundle compatibleWithTraitCollection:nil];
    NSLog(@"image1:%@",image1);
    
    DemoViewController *dvc = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:bundle];
    [self presentViewController:dvc animated:YES completion:^{
        
    }];
}


@end
