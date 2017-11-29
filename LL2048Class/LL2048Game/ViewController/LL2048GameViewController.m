//
//  LL2048GameViewController.m
//  Pods-LL2048
//
//  Created by Lilong on 2017/10/15.
//

#import "LL2048GameViewController.h"
#import "LL2048Route.h"
#import "LL2048Scene.h"
#import "LL2048GlobalState.h"
#import "LL2048GridView.h"
@interface LL2048GameViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet UIView *infoView;
@property (unsafe_unretained, nonatomic) IBOutlet UIView *bestView;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *bestLabel;

@property (unsafe_unretained, nonatomic) IBOutlet UIView *scoreView;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *scoreLabel;

@property (unsafe_unretained, nonatomic) IBOutlet UIView *handleView;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *settingButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *rankingButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *restartButton;

@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *overlayBackground;

@property (strong, nonatomic) LL2048Scene *scene;
@end

@implementation LL2048GameViewController

/**
 隐藏导航栏
 */
- (BOOL)fd_prefersNavigationBarHidden{
    return YES;
}

/**
 隐藏返回手势
 */
- (BOOL)fd_interactivePopDisabled{
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoView.layer.cornerRadius = 5;
    self.infoView.layer.masksToBounds = YES;

    self.bestView.layer.cornerRadius = 5;
    self.bestView.layer.masksToBounds = YES;
    
    self.scoreView.layer.cornerRadius = 5;
    self.scoreView.layer.masksToBounds = YES;
    
    self.overlayBackground.hidden = YES;
    SKView *skView = (SKView *)self.view;
    self.scene = [LL2048Scene sceneWithSize:skView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:self.scene];
    
    [self updateScore:0];
    [self.scene startNewGame];
    
    self.scene.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}
//设置
- (IBAction)settingAction:(id)sender {
    [LLRoute routeWithUrl:[NSURL URLWithString:ll2048_routeWithSetting] currentVC:self hidesBottomBarWhenPushed:YES parameterDict:nil];

}
//排行榜
- (IBAction)rankingAction:(id)sender {
    [LLRoute routeWithUrl:[NSURL URLWithString:ll2048_routeWithRankingList] currentVC:self hidesBottomBarWhenPushed:YES parameterDict:nil];
}
//重新开始
- (IBAction)restartAction:(id)sender {
    
}

//退出
- (IBAction)exitAction:(id)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/**
 分数

 @param score 当前分数
 @param beseScore 最高分
 */
- (void)updateScore:(NSInteger)score beseScore:(NSInteger)beseScore{
    self.scoreLabel.text = [NSString stringWithFormat:@"%zd",score];
    self.bestLabel.text = [NSString stringWithFormat:@"%zd",beseScore];
}

///更新分数
- (void)updateScore:(NSInteger)score{
//    _scoreView.score.text = [NSString stringWithFormat:@"%ld", (long)score];
//    if ([Settings integerForKey:@"Best Score"] < score) {
//        [Settings setInteger:score forKey:@"Best Score"];
//        _bestView.score.text = [NSString stringWithFormat:@"%ld", (long)score];
//    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Pause Sprite Kit. Otherwise the dismissal of the modal view would lag.
    ((SKView *)self.view).paused = YES;
}

- (void)endGame:(BOOL)won{
    self.overlayBackground.hidden = NO;
    self.overlayBackground.alpha = 0;

    // Fake the overlay background as a mask on the board.
    self.overlayBackground.image = [LL2048GridView gridImageWithOverlay];

    [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.overlayBackground.alpha = 1;
    } completion:^(BOOL finished) {
        // Freeze the current game.
        ((SKView *)self.view).paused = YES;
    }];
}

- (void)hideOverlay{
    ((SKView *)self.view).paused = NO;
//    if (!_overlay.hidden) {
//        [UIView animateWithDuration:0.5 animations:^{
//            _overlay.alpha = 0;
//            _overlayBackground.alpha = 0;
//        } completion:^(BOOL finished) {
//            _overlay.hidden = YES;
//            _overlayBackground.hidden = YES;
//        }];
//    }
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
