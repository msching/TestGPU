//
//  TestGPUViewController.m
//  TestGPU
//
//  Created by Chengyin on 14-6-19.
//  Copyright (c) 2014年 Chengyin. All rights reserved.
//

#import "TestGPUViewController.h"

@interface TestGPUViewController ()
{
    UINavigationController *_navigationController;
    UIToolbar *_toolbar;
    UIButton *_button;
}
@end

@implementation TestGPUViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    _toolbar = [[UIToolbar alloc] init];
    _toolbar.frame = CGRectMake(50, 100, 100, 100);
    [self.view addSubview:_toolbar];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(0, 0, 100, 100);
    [_button setTitle:@"click" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(showTestViewView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    UIViewController *testViewController = [[UIViewController alloc] init];
    testViewController.view.backgroundColor = [UIColor grayColor];
    testViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"hide" style:UIBarButtonItemStylePlain target:self action:@selector(hideTestViewView)];
    _navigationController = [[UINavigationController alloc] initWithRootViewController:testViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)showTestViewView
{
    if (_navigationController.view.superview != self.view)
    {
        [self.view addSubview:_navigationController.view];
    }
    
    _navigationController.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
    [UIView animateWithDuration:0.2 animations:^{
        _navigationController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
}

- (void)hideTestViewView
{
    [UIView animateWithDuration:0.2 animations:^{
        _navigationController.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
