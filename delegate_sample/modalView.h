//
// Created by morizyun on 12/11/30.
//

#import <Foundation/Foundation.h>

// プロトコルの宣言
@protocol parentViewDelegate <NSObject>
    // parentView側のメソッド
    -(void) modalViewWillClose:(NSString *)message;
@end

@interface modalView : UIViewController {
    id delegate;
}

@property (nonatomic, strong) id delegate;

@end