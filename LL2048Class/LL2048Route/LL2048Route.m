//
//  LL2048Route.m
//  LLRoute
//
//  Created by Lilong on 2017/10/10.
//

#import "LL2048Route.h"

#import "LL2048AboutViewController.h"  //关于
#import "LL2048MenuViewController.h"   //菜单
#import "LL2048GameViewController.h"   //开始
#import "LL2048RankingListViewController.h" //排行榜
#import "LL2048SettingViewController.h"   //设置
@implementation LL2048Route

//注册路径跳转
+ (void)registerRoute{
    [[LLRouteManager sharedManager] registerRoute:[LL2048Route class]];
}

/**
 跳转前缀
 */
+(NSString *)routeName{
    return LL2048_SCHEME;
}

/**
 组件scheme跳转   子类重新 参考！！！！！！
 
 @param schemeUrl scheme参数
 @param dic 其他特殊参数
 */
+ (void)routeToSchemeUrl:(NSURL *)schemeUrl parameter:(NSMutableDictionary *)dic{
    UIViewController *currentVC = [dic objectForKey:CURRENT_VC_KEY];
    NSLog(@"当前页面  currvc class = %@",[currentVC class]);
    NSString *hidesBottomStr = [dic objectForKey:HIDESBOTTOMBARWHENPUSHED_KEY];
    BOOL hidesBottom;
    if ([hidesBottomStr isEqualToString:HIDESBOTTOMBARWHENPUSHED_YES]) {
        hidesBottom = YES;
    }else{
        hidesBottom = NO;
    }
    [LL2048Route routeWithUrl:schemeUrl currentVC:currentVC hidesBottomBarWhenPushed:hidesBottom parameterDict:dic];
}

/**
 路径跳转
 
 @param url 跳转的url
 @param currentVC 当前跳转的UIViewController
 @param hidesBottomBarWhenPushed 是否隐藏tabbar
 @param parameterDict 需要传递的参数
 */
+ (LL2048Route *)routeWithUrl:(NSURL *)url currentVC:(UIViewController *)currentVC hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed parameterDict:(NSMutableDictionary *)parameterDict{
    LL2048Route *route = [[LL2048Route alloc] initWithUrl:url currentVC:currentVC hidesBottomBarWhenPushed:hidesBottomBarWhenPushed parameterDict:parameterDict];
    return route;
}

- (id)initWithUrl:(NSURL *)url currentVC:(UIViewController *)currentVC hidesBottomBarWhenPushed:(BOOL)yes parameterDict:(NSMutableDictionary *)parameterDict{
    self = [super init];
    if (self) {
        self.currentVC = currentVC;
        self.linkUrl = url;
        self.hidesBottom = yes;
        self.parameterDict = parameterDict;
        [self startParsingWithUrl:url];
    }
    return self;
}

#pragma mark - 开始解析
/**
 *  开始解析
 *
 *  @param url url description
 */
-(void)startParsingWithUrl:(NSURL *)url{
    NSString *scheme = url.scheme;
    if ([scheme hasPrefix:LL2048_SCHEME]) {
        [self routeToModule:[LLRoute getModuleInfo:url]];
    }else if ([scheme isEqualToString:@"http"]||[scheme isEqualToString:@"https"]||[scheme isEqualToString:@"ftp"])
    {
        [self parseToOtherLinkWithUrl:url.absoluteString];
    }else if ([scheme isEqualToString:@"tel"])
    {
        [self parseToPhoneCallWithUrl:url.absoluteString];
    }else{
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"链接地址错误" message:url.absoluteString delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
//        [alertView show];
    }
}

#pragma mark - 解析到对应的模块
/**
 *  解析模块  (内部)
 *
 *  @param moduleInfo url description
 */
-(void)routeToModule:(LLModuleInfo*)moduleInfo{
    if ([moduleInfo.moduleName isEqualToString:@"game"]) {
        //
        [self routeToGameWithModule:moduleInfo];
    }
    
}
/**
 *  解析为外部链接
 *
 *  @param url url description
 */
-(void)parseToOtherLinkWithUrl:(NSString*)url{
    
}

/**
 *  拨打电话
 *
 *  @param url url description
 */
-(void)parseToPhoneCallWithUrl:(NSString*)url{
    UIWebView*callWebview =[[UIWebView alloc] init] ;
    NSURL *telURL =[NSURL URLWithString:url];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [self.currentVC.view addSubview:callWebview];
}


- (void)routeToGameWithModule:(LLModuleInfo*)moduleInfo{
    //开始
    if ([moduleInfo.page isEqualToString:@"/begin"]) {
        [LL2048Route pushToGameBeginWithCurrVC:self.currentVC];
        return;
    }
    //菜单
    if ([moduleInfo.page isEqualToString:@"/menu"]) {
        [LL2048Route pushToGameMenuWithCurrVC:self.currentVC];
        return;
    }
    //关于
    if ([moduleInfo.page isEqualToString:@"/about"]) {
        [LL2048Route pushToGameAboutWithCurrVC:self.currentVC];
        return;
    }
    //排行榜
    if ([moduleInfo.page isEqualToString:@"/rankingList"]) {
        [LL2048Route pushToGameRankingListWithCurrVC:self.currentVC];
        return;
    }
    //设置
    if ([moduleInfo.page isEqualToString:@"/setting"]) {
        [LL2048Route pushToGameSettingWithCurrVC:self.currentVC];
        return;
    }
    
}

//开始
+ (void)pushToGameBeginWithCurrVC:(UIViewController *)currVC{
    LL2048GameViewController *vc = [[LL2048GameViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}

//菜单
+ (void)pushToGameMenuWithCurrVC:(UIViewController *)currVC{
    LL2048MenuViewController *vc = [[LL2048MenuViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}

//关于
+ (void)pushToGameAboutWithCurrVC:(UIViewController *)currVC{
    LL2048AboutViewController *vc = [[LL2048AboutViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}

//排行榜
+ (void)pushToGameRankingListWithCurrVC:(UIViewController *)currVC{
    LL2048RankingListViewController *vc = [[LL2048RankingListViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}
//设置
+ (void)pushToGameSettingWithCurrVC:(UIViewController *)currVC{
    LL2048SettingViewController *vc = [[LL2048SettingViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}




@end
