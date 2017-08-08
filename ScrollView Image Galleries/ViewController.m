//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Tye Blackie on 2017-08-07.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "ViewController.h"
#import "ScrollController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIImage *image1 = [UIImage imageNamed:@"Lighthouse"];
    UIImage *image2 = [UIImage imageNamed:@"Lighthouse-night"];
    UIImage *image3 = [UIImage imageNamed:@"Lighthouse-in-Field"];

    self.imageView1 = [[UIImageView alloc] initWithImage:image1];
    self.imageView2 = [[UIImageView alloc] initWithImage:image2];
    self.imageView3 = [[UIImageView alloc] initWithImage:image3];
    
    self.imageView1.frame = CGRectMake (0,0,self.view.frame.size.width,self.view.frame.size.height);
    self.imageView2.frame = CGRectMake (self.view.frame.size.width,0,self.view.frame.size.width,self.view.frame.size.height);
    self.imageView3.frame = CGRectMake (self.view.frame.size.width*2,0,self.view.frame.size.width,self.view.frame.size.height);
    
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    [self.scrollView addSubview:self.imageView3];
    
    self.scrollView.contentSize = CGSizeMake(self.imageView1.frame.size.width*3, self.view.frame.size.height);
    //constraints for imageView1 Here
    
//    UITapGestureRecognizer *imageSelectionGesture = [[[UITapGestureRecognizer alloc] init] initWithTarget:self action:@selector(imageSelected:)];

    


    
}


-(void) imageSelected:(UITapGestureRecognizer*) sender{
    
    [self performSegueWithIdentifier:(@"touchForDetail") sender:sender];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"touchForDetail"]) {
        
        ScrollController *imageDetails =  [segue destinationViewController];
        
        if ([self.pageControl currentPage] == 0) {
            NSLog(@"first");
            UIImage *image = self.imageView1.image;
            imageDetails.image = image;
        }else if ([self.pageControl currentPage] ==1) {
            UIImage *image = self.imageView2.image;
            imageDetails.image = image;
        }else{
            UIImage *image = self.imageView3.image;
            imageDetails.image = image;
        }
    }
    
    
    
}

@end
