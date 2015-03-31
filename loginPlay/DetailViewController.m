//
//  DetailViewController.m
//  loginPlay
//
//  Created by Taylor Mott on 31 Mar 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "DetailViewController.h"
#import "UIView+FLKAutoLayout.h"

@interface DetailViewController ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *backButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:1];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture.png"]];
    [self.imageView addGestureRecognizer:tap];
    [self.imageView setUserInteractionEnabled:YES];
    [self.view addSubview:self.imageView];
    
    self.backButton = [UIButton new];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    [self.imageView alignTopEdgeWithView:self.view predicate:@"120"];
    [self.imageView alignCenterXWithView:self.view predicate:nil];
    [self.imageView constrainWidth:@"100" height:@"100"];
    
    [self.backButton constrainTopSpaceToView:self.imageView predicate:@"50"];
    [self.backButton alignCenterXWithView:self.view predicate:nil];
    [self.backButton constrainWidthToView:self.view predicate:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tapped
{
    [self.imageView setImage:[UIImage imageNamed:@"hello.png"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
