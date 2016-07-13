//
//  HelpViewController.m
//  first
//
//  Created by HS on 16/7/12.
//  Copyright © 2016年 HS. All rights reserved.
//

#import "HelpViewController.h"
#import "UIImage+GIF.h"

@interface HelpViewController ()<UIWebViewDelegate>
{
    UIImageView *loading;
    UILabel *loadingLabel;
}
@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    _webView.delegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.rabbitpre.com/m/FvQnIzl"]]];
    [self.view addSubview:_webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //刷新控件
    
    loading = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    loading.center = self.view.center;
    loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(PanScreenWidth/2 - 60, PanScreenHeight/2 + 25, 150, 30)];
    loadingLabel.text = @"正在拼命加载中...";
    
    UIImage *image = [UIImage sd_animatedGIFNamed:@"刷新1"];
    [loading setImage:image];
    [self.view addSubview:loading];
    [self.view addSubview:loadingLabel];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [loading removeFromSuperview];
    [loadingLabel removeFromSuperview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end