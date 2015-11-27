//
//  Register_ViewController.m
//  
//
//  Created by yd on 15/11/27.
//
//

#import "Register_ViewController.h"
#import "LCTableViewPickerControl.h"
@interface Register_ViewController ()<UITextFieldDelegate,LCItemPickerDelegate>
{
    UITextField *schoolName;
    UITextField *userTel;
    UITextField *userPsw;
    
}

@property (nonatomic, strong) UIView *maskView;
@property (weak) id pickValue;

@end

@implementation Register_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册账号";

    [self createView];
}

-(void)createView{
    //    NSArray *title = @[@"请输入将要修改密码的账号",@"请输入原密码",@"请输入新密码"];
    
    
    schoolName = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/6, CGRectGetHeight([UIScreen mainScreen].bounds)/4, CGRectGetWidth([UIScreen mainScreen].bounds)*2/3 -64, 44)];
    schoolName.tag = 100;
    schoolName.backgroundColor  = [UIColor whiteColor];
    schoolName.placeholder = @"选择学校";
    schoolName.textColor = [UIColor blackColor];
    schoolName.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:schoolName];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(CGRectGetMaxX(schoolName.frame), CGRectGetHeight([UIScreen mainScreen].bounds)/4, 64 , 44);
    [button setImage:[UIImage imageNamed:@"xia"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.userInteractionEnabled = YES;
    
    [button addTarget:self action:@selector(selelctSchool) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    userTel = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/6, CGRectGetMaxY(schoolName.frame)+5, CGRectGetWidth([UIScreen mainScreen].bounds)*2/3 , 44)];
    userTel.placeholder  = @"请输入手机号";
    userTel.backgroundColor  = [UIColor whiteColor];
    userTel.textColor = [UIColor blackColor];
    userTel.borderStyle = UITextBorderStyleRoundedRect;
    userTel.delegate = self;
    [self.view addSubview:userTel];
    
    userPsw = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/6, CGRectGetMaxY(userTel.frame)+5, CGRectGetWidth([UIScreen mainScreen].bounds)*2/3 , 44)];
    userPsw.placeholder  = @"请输入密码";
    userPsw.backgroundColor  = [UIColor whiteColor];
    userPsw.textColor = [UIColor blackColor];
    userPsw.delegate = self;
    userPsw.borderStyle = UITextBorderStyleRoundedRect;
    userPsw.secureTextEntry = YES;
    [self.view addSubview:userPsw];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame  = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/3, CGRectGetMaxY(userPsw.frame)+10, CGRectGetWidth([UIScreen mainScreen].bounds)/3, 44);
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0.308 green:0.820 blue:0.754 alpha:1.000];
    [btn addTarget:self action:@selector(modifyBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 10;
    [self.view addSubview:btn];
    
    
}


-(void)modifyBtn{
    NSLog(@"...%@..........%@....%@.",schoolName.text,userTel.text,userTel.text);
}

-(void)selelctSchool{
    LCTableViewPickerControl *pickerView = [[LCTableViewPickerControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, kPickerControlWidth, kPickerControlAgeHeight) title:@"选择学校" value:_pickValue items:@[@"贵州大学",@"贵阳学院",@"贵阳商学院",@"贵阳医学院",@"贵阳财经大学",@"贵阳民族大学",@"贵州大学",@"贵阳学院",@"贵阳商学院",@"贵阳医学院",@"贵阳财经大学",@"贵阳民族大学"] offset:CGPointMake(0, 0)];
    [pickerView setDelegate:self];
    [pickerView setTag:0];
    
    [self.view addSubview:pickerView];
    
    [pickerView showInView:self.view];
    
}




- (void)dismissPickerControl:(LCTableViewPickerControl*)view
{
    [view dismiss];
}


#pragma mark - LCTableViewPickerDelegate


- (void)selectControl:(LCTableViewPickerControl*)view didSelectWithItem:(id)item
{
    /*
     Check item is NSString or NSNumber , if it is necessary
     */
    if (view.tag == 0)
    {
        if ([item isKindOfClass:[NSString class]])
        {
            
        }
        else if ([item isKindOfClass:[NSNumber class]])
        {
            
        }
    }
    
    self.pickValue = item;
    [schoolName setText:[NSString stringWithFormat:@"%@", item]];
//    [schoolName setText:[NSString stringWithFormat:@"%@", item]];
    [self dismissPickerControl:view];
}

- (void)selectControl:(LCTableViewPickerControl *)view didCancelWithItem:(id)item
{
    
    [self dismissPickerControl:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
