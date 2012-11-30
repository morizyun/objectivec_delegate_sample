//
// Created by morizyun on 12/11/30.
//

#import "modalView.h"

@implementation modalView {

}
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor darkGrayColor]];

    // モーダルビューの画面タイトル
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 320, 30)];
    [titleLabel setText:@"呼び出されたモーダルビュー"];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setBackgroundColor:[UIColor darkGrayColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:titleLabel];

    // モーダルビュー内のボタン
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(80, 150, 160, 40)];
    [button setTitle:@"モーダルを閉じる" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendMessageToParent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

// ボタンが押された時に呼び出されるメソッド
- (void) sendMessageToParent{
    [delegate modalViewWillClose:@"modalViewからのお願い。modalを閉じて"];
}


@end