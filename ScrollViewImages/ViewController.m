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

@property (nonatomic, strong) NSArray <UIImage *> *images;
//@property (nonatomic) UIImageView *image1;
//@property (nonatomic) UIImageView *image2;
//@property (nonatomic) UIImageView *image3;

@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapGesture;

@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@end

@implementation ViewController

#pragma mark VIEWS

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    //[UIImage imageNamed:@"Lighthouse-in-Field"];
    //[UIImage imageNamed:@"Lighthouse-night"];
    //[UIImage imageNamed:@"Lighthouse-zoomed"];
    //NSArray *images = @[self.image1, self.image2, self.image3];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:YES]; //rely on frames
    [self setupScrollForPaging]; //page scrolling
}

#pragma mark IMAGES

-(NSArray<UIImage *> *)images{
    return @[[UIImage imageNamed:@"Lighthouse-in-Field"],
             [UIImage imageNamed:@"Lighthouse-night"],
             [UIImage imageNamed:@"Lighthouse-zoomed"]];
}

#pragma mark PAGING

-(void)setupScrollForPaging{ 
    CGFloat width = CGRectGetWidth(self.scrollView.frame);
    CGFloat height = CGRectGetHeight(self.scrollView.frame);
    //CGFloat width = self.view.frames.size.width;
    //CGFloat height = self.view.frames.size.height;
    [self.images enumerateObjectsUsingBlock:^(UIImage *_Nonnull image, NSUInteger idx, BOOL *_Nonnull stop){ //set frames for each image
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];  //initializes image view with image
        imageView.frame = CGRectMake(width*idx, 0, width, height); //sets frame
        imageView.contentMode = UIViewContentModeScaleAspectFit; //scales it to fit
        imageView.clipsToBounds = YES;

        imageView.userInteractionEnabled = YES;  //UI enabled
        [self.scrollView addSubview:imageView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [imageView addGestureRecognizer:tapGesture];
    }];
    
    self.scrollView.contentSize = CGSizeMake(self.images.count*width,height); //sets scroll content size
    self.scrollView.pagingEnabled = YES;
    
}

#pragma mark SEGUE

-(IBAction)tapped:(UITapGestureRecognizer *)sender{  //when tapped on image
    CGPoint location = [sender locationInView:self.scrollView];
    UIImageView *imageView = (UIImageView *)[self.scrollView hitTest:location withEvent:nil];
    
    if([imageView isKindOfClass:[UIImageView class]]){
        
        // 1. Instantiate viewcontroller from storyboard
        // Get main storyboard
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        // Get new view controller
        NewViewController *nvc = [storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
        nvc.passedImage = ((UIImageView *)sender.view).image;
        
        // Navigate to new view controller
        [self.navigationController pushViewController:nvc animated:YES];
        
       // [self performSegueWithIdentifier:@"showDetails" sender:imageView.image];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{  //call showDetails in NewController
    if([segue.identifier isEqualToString:@"showDetails"]){
        ((NewViewController *)segue.destinationViewController).passedImage = sender; //segue to NewController
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{   //takes in scroll view
    CGFloat width = self.scrollView.frame.size.width;
    NSInteger page = ((self.scrollView.contentOffset.x)/width);  //page gets image
    self.pageController.currentPage = page;   //curent page shown by reciever
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
