//
//  Home_ViewController.m
//  
//
//  Created by yd on 15/11/26.
//
//

#import "Home_ViewController.h"

#import "First_ViewController.h"
#import "Second_ViewController.h"
#import "Third_ViewController.h"
#import "Forth_ViewController.h"

#import "JRSegmentViewController.h"

#import "MJRefresh.h"

@interface Home_ViewController ()


@end

@implementation Home_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    
}
-(void)viewWillAppear:(BOOL)animated{
   
}
-(void)viewDidAppear:(BOOL)animated{
    First_ViewController *firstVC = [[First_ViewController alloc] init];
    Second_ViewController *secondVC = [[Second_ViewController alloc] init];
    Third_ViewController *thirdVC = [[Third_ViewController alloc] init];
    Forth_ViewController *forthVC = [[Forth_ViewController alloc] init];
    
    
    JRSegmentViewController *vc = [[JRSegmentViewController alloc] init];
    vc.segmentBgColor = [UIColor colorWithRed:18.0f/255 green:50.0f/255 blue:110.0f/255 alpha:1.0f];
    vc.indicatorViewColor = [UIColor whiteColor];
    
    [vc setViewControllers:@[firstVC, secondVC, thirdVC,forthVC]];
    [vc setTitles:@[@"课程推荐", @"创业相关", @"就业指导",@"兼职"]];
    
    [self.navigationController pushViewController:vc animated:NO];
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
