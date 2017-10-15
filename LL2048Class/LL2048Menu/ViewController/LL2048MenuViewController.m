//
//  LL2048MenuViewController.m
//  Pods-LL2048
//
//  Created by Lilong on 2017/10/15.
//

#import "LL2048MenuViewController.h"
#import "LL2048Route.h"

@interface LL2048MenuViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *gameBeganButton;

@property (unsafe_unretained, nonatomic) IBOutlet UIButton *gameSettingButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *gameRankingButton;

@end

@implementation LL2048MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//游戏开始
- (IBAction)gameBeganAction:(id)sender {
    [LLRoute routeWithUrl:[NSURL URLWithString:ll2048_routeWithBegin] currentVC:self hidesBottomBarWhenPushed:YES parameterDict:nil];

}
//游戏设置
- (IBAction)gameSettingAction:(id)sender {
    [LLRoute routeWithUrl:[NSURL URLWithString:ll2048_routeWithSetting] currentVC:self hidesBottomBarWhenPushed:YES parameterDict:nil];

}
//排行榜
- (IBAction)gameRankingAction:(id)sender {
    [LLRoute routeWithUrl:[NSURL URLWithString:ll2048_routeWithRankingList] currentVC:self hidesBottomBarWhenPushed:YES parameterDict:nil];
}
//关于
- (IBAction)gameAboutAction:(id)sender {
    [LLRoute routeWithUrl:[NSURL URLWithString:ll2048_routeWithAbout] currentVC:self hidesBottomBarWhenPushed:YES parameterDict:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
