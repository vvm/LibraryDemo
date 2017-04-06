//
//  ViewController.m
//  LibraryDemo
//
//  Created by vee on 2017/4/1.
//  Copyright © 2017年 None. All rights reserved.
//

#import "ViewController.h"
#import <DyFrameWork/DemoViewController.h>

#import <DyFrameWork/Custom1.h>

NSString * const LIB = @"CONST LIB IN HOST";

@interface NSString (C22)

- (void)ll;

@end

@implementation NSString (C22)

+ (void)load
{
    printf("load from vc");
}

- (void)ll
{
    NSLog(@"in host");
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString* a = @"a";
    [a ll];
    
    Custom1* c1 = [[Custom1 alloc] init];
    [c1 xx];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)someAction:(id)sender
{
    NSBundle *bundle = [NSBundle bundleForClass:[DemoViewController class]];
    
    UIImage *image1 = [UIImage imageNamed:@"cart" inBundle:bundle compatibleWithTraitCollection:nil];
    NSLog(@"image1:%@",image1);
    
    image1 = [UIImage imageNamed:@"arrow" inBundle:bundle compatibleWithTraitCollection:nil];
    NSLog(@"image1:%@",image1);
    
    DemoViewController *dvc = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:bundle];
    [self presentViewController:dvc animated:YES completion:^{
        
    }];
}


@end
