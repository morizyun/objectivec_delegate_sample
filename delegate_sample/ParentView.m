//
//  ParentView.m
//  delegate_sample
//
//  Created by morizyun on 11/30/12.
//

#import "ParentView.h"
#import "modalView.h"

@interface ParentView ()

@end

@implementation ParentView

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    // parentViewの画面表示タイトル
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 320, 30)];
    [titleLabel setText:@"呼び出し元の親ビュー"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:titleLabel];

    // parentViewのモーダルを呼び出すためのボタン
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(80, 150, 160, 40)];
    [button setTitle:@"モーダルを呼び出す" forState:UIControlStateNormal];
    // ボタンをタップしたら、openModalViewメソッドを呼び出し
    [button addTarget:self action:@selector(openModalView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

// modalViewを呼び出すためのメソッド
- (void)openModalView
{
    modalView *view = [[modalView alloc] init];
    view.delegate = self;
    [self presentViewController:view animated:YES completion:nil];
}

// modalViewからDelegateで呼び出されるメソッド
-(void) modalViewWillClose:(NSString *)message
{
    // modalViewを閉じる
    [self dismissViewControllerAnimated:YES completion:nil];

    // modalViewから受け取ったmessageを画面に表示
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 30)];
    [titleLabel setText:message];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setBackgroundColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:titleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end