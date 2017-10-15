//
//  LL2048Route.h
//  LLRoute
//
//  Created by Lilong on 2017/10/10.
//

#import <Foundation/Foundation.h>
#import "LLRoute.h"
#import "LLRouteManager.h"

#define LL2048_SCHEME @"ll2048"

//开始页面
static NSString *const ll2048_routeWithBegin = @"ll2048://game/begin";
//菜单
static NSString *const ll2048_routeWithMenu = @"ll2048://game/menu";
//关于
static NSString *const ll2048_routeWithAbout = @"ll2048://game/about";
//排行榜
static NSString *const ll2048_routeWithRankingList = @"ll2048://game/rankingList";
//设置
static NSString *const ll2048_routeWithSetting = @"ll2048://game/setting";

@interface LL2048Route : NSObject
@property (nonatomic,strong) UIViewController *currentVC; //跳转的VC
@property (nonatomic,strong) NSURL *linkUrl; //链接地址
@property (nonatomic,assign) BOOL isPush; //是否跳转页面
@property (nonatomic,assign) BOOL hidesBottom; //是否跳转页面
@property (nonatomic,strong) NSMutableDictionary *parameterDict; //对象参数

//注册路径跳转
+ (void)registerRoute;

/**
 路径跳转
 
 @param url 跳转的url
 @param currentVC 当前跳转的UIViewController
 @param hidesBottomBarWhenPushed 是否隐藏tabbar
 @param parameterDict 需要传递的参数
 */
+ (LL2048Route *)routeWithUrl:(NSURL *)url currentVC:(UIViewController *)currentVC hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed parameterDict:(NSMutableDictionary *)parameterDict;
@end
