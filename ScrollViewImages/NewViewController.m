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
    [self showDetails];
}


-(void)showDetails{
    self.aImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.aImageView = [[UIImageView alloc] initWithImage:self.passedImage];
    [self.aScrollView addSubview:self.aImageView];
    
    self.aScrollView.contentSize = self.aImageView.bounds.size;
    self.aScrollView.minimumZoomScale = 0.25;
    self.aScrollView.maximumZoomScale = 4.0;
    self.aScrollView.zoomScale = 1.0;
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
