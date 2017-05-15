//
//  NewViewController.m
//  ScrollViewImages
//
//  Created by Rushan on 2017-05-15.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *aScrollView;
@property (nonatomic) UIImageView *aImageView;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.imageView = [[UIImageView alloc]initWithImage:self.newImage];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.aScrollView setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self showDetails]; //show details
}


-(void)showDetails{
    self.aImageView.contentMode = UIViewContentModeScaleAspectFit; //aspect fit
    self.aImageView = [[UIImageView alloc] initWithImage:self.passedImage]; //gets passed image
    [self.aScrollView addSubview:self.aImageView];
    
    self.aScrollView.contentSize = self.aImageView.bounds.size; //sets bounds
    self.aScrollView.minimumZoomScale = 0.25;  //min zoom scale
    self.aScrollView.maximumZoomScale = 4.0;   //max zoom scale
    self.aScrollView.zoomScale = 1.0;   //default zoom scale
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.aImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 Enable pinch-to-zoom:
set the scroll view's minimum and maximum zoom scale.
implement the UIScrollViewDelegate method viewForZoomingInScrollView: to tell the scroll view which view to zoom.
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
