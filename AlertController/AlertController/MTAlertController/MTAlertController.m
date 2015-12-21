//
//  MTAlertController.m
//  AlertController
//
//  Created by Srinivas on 11/26/15.
//  Copyright © 2015 mtuity. All rights reserved.
//

#import "MTAlertController.h"
#import "AppDelegate.h"
#import "UIAlertView+CustomAlertView.h"
#import "UIActionSheet+Blocks.h"

static UIAlertController *presentedViewController;
static UIAlertView *presentedAlertView;


@interface MTAlertController(){
    
}

@property(nonatomic,strong)MTAlertCancelBlock cancelBlock;
@property(nonatomic,strong)MTAlertOKBlock okBlock;

@end

@implementation MTAlertController


+(void)showAlertWithEmailText:(NSString*)message withPlaceHolder:(NSString*)str andTitle:(NSString*)title andOkButtonTitle:(NSString*)okButtonTitle andtarget:(id)currentClass asText:(BOOL)isText andAlertCancelBlock:(MTAlertCancelBlock)cancelBlock andAlertOkBlock:(MTAlertOKBlock)okAction{
    if (NSClassFromString(@"UIAlertController")) {
        presentedViewController=   [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            
            UITextField *userName = presentedViewController.textFields.firstObject;
            okAction(userName.text);
        }];
        
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            
            cancelBlock();
            [presentedViewController dismissViewControllerAnimated:YES completion:nil];
            
        }];
        [presentedViewController addAction:cancel];
        [presentedViewController addAction:ok];
        
        [presentedViewController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            if (isText) {
                textField.text = message;
            }
            
            
            textField.placeholder = str;
            
        }];
        
        [currentClass presentViewController:presentedViewController animated:YES completion:nil];
        
    }else{
        presentedAlertView = [[UIAlertView alloc] initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:okButtonTitle, nil];
        presentedAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField *textField = [presentedAlertView textFieldAtIndex:0];
        if (isText)
            textField.text = message;
        else
            textField.placeholder = str;
        
        [presentedAlertView showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 0) {
                cancelBlock();
            }else if (buttonIndex == 1){
                
                okAction([alertView textFieldAtIndex:0].text);
                
            }
        }];
    }
}

+(void)showAlertWithMessage:(NSString*)message andTitle:(NSString*)title andOkButtonTitle:(NSString*)okButtonTitle andCancelTitle:(NSString*)cancleTitle andtarget:(id)currentClass andAlertCancelBlock:(MTAlertCancelBlock)cancelBlock andAlertOkBlock:(MTAlertOKBlock)okAction{
    if (NSClassFromString(@"UIAlertController")) {
        UIAlertController * alert=   [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        if (cancleTitle.length) {
            UIAlertAction* cancel = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                
                cancelBlock();
                
                [alert dismissViewControllerAnimated:YES completion:nil];
                
            }];
            [alert addAction:cancel];
        }
        
        if (okButtonTitle.length) {
            UIAlertAction* ok = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){                                                           okAction(@"OK");
            }];
            [alert addAction:ok];
        }
        [currentClass presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancleTitle otherButtonTitles:okButtonTitle, nil];
        
        [alertView showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
            
            if ([title isEqualToString:@"Yes"]) {
                okAction(@"OK");
                
            }else if ([title isEqualToString:@"OK"]){
                okAction(@"OK");
            }
        }];
    }
}

+(void)showActionSheetTitles:(NSArray *) titleArray target:(id)currentClass withCancelBlock:(MTAlertCancelBlock)cancelBlock andAlertOKBlock:(MTAlertOtherButtonsBlock)okBlock{
    if (NSClassFromString(@"UIAlertController")) {
        UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action1;
        for (NSString *strTitle in titleArray) {
            
            action1 = [UIAlertAction actionWithTitle:strTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                okBlock([titleArray indexOfObject:strTitle]);
            }];
            
            [actionSheetController addAction:action1];
            
        }
        
        
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            [actionSheetController dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [actionSheetController addAction:cancel];
        
        //    actionSheetController.view.tintColor = BTBlackColor;
        [currentClass presentViewController:actionSheetController animated:YES completion:nil];
        
        
    }else {
        //For IOS 7 devices
        UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:nil
                                                        delegate:nil
                                               cancelButtonTitle:@"Cancel"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:titleArray, nil];
        
        as.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        
        as.tapBlock = ^(UIActionSheet *actionSheet, NSInteger buttonIndex){
            
            okBlock(buttonIndex);
            NSLog(@"Chose %@", [actionSheet buttonTitleAtIndex:buttonIndex]);
        };
        
        UIViewController *vc =currentClass;
        [as showInView:[vc view]];
        
    }
}



@end
