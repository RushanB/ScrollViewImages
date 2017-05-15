//
//  ViewController.m
//  ScrollViewImages
//
//  Created by Rushan on 2017-05-15.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *image1;
@property (nonatomic) UIImageView *image2;
@property (nonatomic) UIImageView *image3;



@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    [UIImage imageNamed:@"Lighthouse-in-Field"];
    [UIImage imageNamed:@"Lighthouse-night"];
    [UIImage imageNamed:@"Lighthouse-zoomed"];
    
    NSArray *images = @[self.image1, self.image2, self.image3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
