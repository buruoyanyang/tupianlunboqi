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
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i = 0; i < 5; i++) {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.scrollView addSubview:iconView];
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i+1];
        iconView.image = [UIImage imageNamed:imageName];
        //计算frame
        CGFloat x= i *self.scrollView.frame.size.width;
        iconView.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    int count = 5;
    self.scrollView.contentSize = CGSizeMake(count * self.scrollView.frame.size.width , 0);
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //设置分页
    self.scrollView.pagingEnabled = YES;
    
    //设置pageControl
    self.pageControl.numberOfPages = count;
    
    //设置代理
    self.scrollView.delegate = self;
    
    //设置定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //启动定时器
    //消息循环
    //获取当前线程的消息循环
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    //把定时器添加到消息循环中
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void)nextImage
{
    NSInteger page = self.pageControl.currentPage;
    //计算下一张图片的偏移
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
    }
    else
    {
        page++;
    }
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(offsetX, 0);
    }];
//    self.pageControl.currentPage = page;
}


#pragma mark - scrollView的代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
