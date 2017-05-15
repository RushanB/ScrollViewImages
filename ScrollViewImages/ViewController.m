//
//  ViewController.m
//  ScrollViewImages
//
//  Created by Rushan on 2017-05-15.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) NSArray <UIImage *> *images;
//@property (nonatomic) UIImageView *image1;
//@property (nonatomic) UIImageView *image2;
//@property (nonatomic) UIImageView *image3;

@property (nonatomic) UITapGestureRecognizer *tapGesture;

@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    //[UIImage imageNamed:@"Lighthouse-in-Field"];
    //[UIImage imageNamed:@"Lighthouse-night"];
    //[UIImage imageNamed:@"Lighthouse-zoomed"];
    //NSArray *images = @[self.image1, self.image2, self.image3];
 
}


-(NSArray<UIImage *> *)images{
    return @[[UIImage imageNamed:@"Lighthouse-in-Field"],
             [UIImage imageNamed:@"Lighthouse-night"],
             [UIImage imageNamed:@"Lighthouse-zoomed"]];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:YES]; //rely on frames
    [self setupScrollForPaging]; //page scrolling
}

-(void)setupScrollForPaging{ 
    CGFloat width = CGRectGetWidth(self.scrollView.frame);
    CGFloat height = CGRectGetHeight(self.scrollView.frame);
    //CGFloat width = self.view.frames.size.width;
    //CGFloat height = self.view.frames.size.height;
    [self.images enumerateObjectsUsingBlock:^(UIImage *_Nonnull image, NSUInteger idx, BOOL *_Nonnull stop){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(width*idx, 0, width, height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;

        imageView.userInteractionEnabled = YES;
        [self.scrollView addSubview:imageView];
    }];
    self.scrollView.contentSize = CGSizeMake(self.images.count*width,height);
    self.scrollView.pagingEnabled = YES;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat width = self.scrollView.frame.size.width;
    NSInteger page = ((self.scrollView.contentOffset.x)/width);
    self.pageController.currentPage = page;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
