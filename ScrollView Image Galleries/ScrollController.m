//
//  ScrollController.m
//  ScrollView Image Galleries
//
//  Created by Tye Blackie on 2017-08-07.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "ScrollController.h"

@interface ScrollController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView1;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollController;


@end

@implementation ScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.imageView1 = [[UIImageView alloc] initWithImage:self.image];
    
    [self.view addSubview:self.scrollController];
    [self.scrollController addSubview:self.imageView1];
    
    self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;

    [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollController.topAnchor].active = YES;
    [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollController.bottomAnchor].active = YES;
    [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollController.leadingAnchor].active = YES;
    [self.imageView1.trailingAnchor constraintEqualToAnchor:self.scrollController.trailingAnchor].active = YES;
    
    self.scrollController.minimumZoomScale = 0.3;
    self.scrollController.maximumZoomScale = 3.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UI Scroll View Delegate


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollController {
    return self.imageView1;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
}




@end
