//
//  ViewController.m
//  tupianlunboqi
//
//  Created by xhf on 16/1/14.
//  Copyright © 2016年 xhf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i = 0; i < 5; i++) {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.scrollView addSubview:iconView];
        NSString *imageName = [NSString stringWithFormat:@"img_%2d",i+1];
        iconView.image = [UIImage imageNamed:imageName];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
