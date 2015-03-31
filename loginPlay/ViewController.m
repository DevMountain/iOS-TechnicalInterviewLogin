//
//  ViewController.m
//  loginPlay
//
//  Created by Taylor Mott on 31 Mar 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITextField *usernameField;
@property (strong, nonatomic) UITextField *passwordField;
@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.usernameField = [UITextField new];
    self.usernameField.placeholder = @"Username";
    self.usernameField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.usernameField];
    
    self.passwordField = [UITextField new];
    self.passwordField.secureTextEntry = YES;
    self.passwordField.placeholder = @"Password";
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.passwordField];
    
    self.loginButton = [UIButton new];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    
    [self.usernameField alignTopEdgeWithView:self.view predicate:@"120"];
    [self.usernameField constrainWidthToView:self.view predicate:@"-10"];
    [self.usernameField alignCenterXWithView:self.view predicate:nil];
    [self.usernameField constrainHeight:@"44"];
    
    [self.passwordField constrainTopSpaceToView:self.usernameField predicate:@"25"];
    [self.passwordField constrainWidthToView:self.view predicate:@"-10"];
    [self.passwordField alignCenterXWithView:self.view predicate:nil];
    [self.passwordField constrainHeight:@"44"];
    
    [self.loginButton constrainTopSpaceToView:self.passwordField predicate:@"25"];
    [self.loginButton alignCenterXWithView:self.passwordField predicate:nil];
    [self.loginButton constrainWidthToView:self.view predicate:nil];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    self.usernameField.text = @"";
    self.passwordField.text = @"";
}

- (BOOL)validate
{
    
    NSRange notFoundRange = NSMakeRange(NSNotFound, 0);
    NSCharacterSet *notAlphabet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
    
    if (   (self.usernameField.text.length > 7)
        && (self.passwordField.text.length > 7)
        && (NSEqualRanges([self.usernameField.text rangeOfCharacterFromSet:notAlphabet], notFoundRange)))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)loginButtonPressed
{
    if ([self validate])
    {
        [self.navigationController showViewController:[DetailViewController new] sender:self];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You need valid input" message:@"* Username contains only letters\n* Username length >= 8\n* Password length >= 8" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okay];

        [self presentViewController:alert animated:YES completion:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
