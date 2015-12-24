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
@end

@implementation MTAlertController


#pragma mark AlertView-message-Methods

+ (void)showWithAlertTitle:(NSString *)title
                   message:(NSString *)message
                    target:(id)currentClass
         cancelButtonTitle:(NSString *)cancelButtonTitle {
    [MTAlertController showWithAlertTitle:title message:message target:currentClass cancelButtonTitle:cancelButtonTitle cancelBlock:nil okButtonTitle:nil okBlock:nil otherButtonsBlock:nil otherButtonTitles:NULL];

}


+ (void)showWithAlertTitle:(NSString *)title
                   message:(NSString *)message
                    target:(id)currentClass
         cancelButtonTitle:(NSString *)cancelButtonTitle
               cancelBlock:(MTAlertCancelBlock)cancelBlock {
     [MTAlertController showWithAlertTitle:title message:message target:currentClass cancelButtonTitle:cancelButtonTitle cancelBlock:cancelBlock okButtonTitle:nil okBlock:nil otherButtonsBlock:nil otherButtonTitles:NULL];
}

+ (void)showWithAlertTitle:(NSString *)title
                   message:(NSString *)message
                    target:(id)currentClass
             okButtonTitle:(NSString *)okButtonTitle {
     [MTAlertController showWithAlertTitle:title message:message target:currentClass cancelButtonTitle:nil cancelBlock:nil okButtonTitle:okButtonTitle okBlock:nil otherButtonsBlock:nil otherButtonTitles:NULL];
    
}

+ (void)showWithAlertTitle:(NSString *)title
                   message:(NSString *)message
                    target:(id)currentClass
             okButtonTitle:(NSString *)okButtonTitle
                   okBlock:(MTAlertOKBlock)okBlock {
      [MTAlertController showWithAlertTitle:title message:message target:currentClass cancelButtonTitle:nil cancelBlock:nil okButtonTitle:okButtonTitle okBlock:okBlock otherButtonsBlock:nil otherButtonTitles:NULL];
}

+ (void)showWithAlertTitle:(NSString *)title
                   message:(NSString *)message
                    target:(id)currentClass
         cancelButtonTitle:(NSString *)cancelButtonTitle
               cancelBlock:(MTAlertCancelBlock)cancelBlock
             okButtonTitle:(NSString *)okButtonTitle
                   okBlock:(MTAlertOKBlock)okBlock {
    [MTAlertController showWithAlertTitle:title message:message target:currentClass cancelButtonTitle:cancelButtonTitle cancelBlock:cancelBlock okButtonTitle:okButtonTitle okBlock:okBlock otherButtonsBlock:nil otherButtonTitles:NULL];
    
}


+ (void)showWithAlertTitle:(NSString *)title
                   message:(NSString *)message
                    target:(id)currentClass
         cancelButtonTitle:(NSString *)cancelButtonTitle
               cancelBlock:(MTAlertCancelBlock)cancelBlock
             okButtonTitle:(NSString *)okButtonTitle
                   okBlock:(MTAlertOKBlock)okBlock
         otherButtonsBlock:(MTAlerViewtOtherButtonsBlock)otherButtonsBlock
         otherButtonTitles:(NSString *)otherButtonTitles, ...  {
    
    if (NSClassFromString(@"UIAlertController")) {
        UIAlertController * alertVC=   [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        if (cancelButtonTitle.length) {
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
                if (cancelBlock) {
                 cancelBlock();
                }

                
                [alertVC dismissViewControllerAnimated:YES completion:nil];
                
            }];
            [alertVC addAction:cancelAction];
        }
        
        if (okButtonTitle.length) {
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                
                if (okBlock) {
                okBlock(okButtonTitle);
                }
                
            }];
            [alertVC addAction:okAction];
        }
        
        
        va_list args;
        va_start(args, otherButtonTitles);
        int index =0 ;
        for (NSString *buttonTitle = otherButtonTitles; buttonTitle != nil; buttonTitle = va_arg(args, NSString*))
        {
            // Assumes that no "other button" titles match the Cancel or OK button titles
            UIAlertAction* otherAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                if(otherButtonsBlock) {
                otherButtonsBlock(buttonTitle,index);
                }
            }];
            [alertVC addAction:otherAction];
            index++;
        }
        va_end(args);
        
        [currentClass presentViewController:alertVC animated:YES completion:nil];
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:okButtonTitle,otherButtonTitles, nil];
        
        
        [alertView showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
            if (buttonIndex == alertView.cancelButtonIndex) {
                if (cancelBlock) {
                cancelBlock();
                }

            } else if(buttonIndex == 0) {
                if (okBlock) {
                    okBlock(title);
                }
            } else {
                if (otherButtonsBlock) {
                    otherButtonsBlock(title,buttonIndex);

                }
            }
            
        
        }];
    }
    
    
}


#pragma mark AlertView-inputText-Methods


+(void)showAlertWithIntputText:(NSString*)strText
                   placeHolder:(NSString*)placeHolderString
                         title:(NSString*)title
                        target:(id)currentClass
                        isEdit:(BOOL)isEdit
                 okButtonTitle:(NSString*)okButtonTitle
                    okBlock:(MTAlertOKBlock)okBlock
                 cancelButtonTitle:(NSString*)cancelButtonTitle
                   cancelBlock:(MTAlertCancelBlock)cancelBlock {
    if (NSClassFromString(@"UIAlertController")) {
        presentedViewController=   [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            
            UITextField *userName = presentedViewController.textFields.firstObject;
            if (okBlock) {
                okBlock(userName.text);
            }

        }];
        
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            if (cancelBlock) {
                cancelBlock();
            }
            [presentedViewController dismissViewControllerAnimated:YES completion:nil];
            
        }];
        [presentedViewController addAction:cancel];
        [presentedViewController addAction:ok];
        
        [presentedViewController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            if (isEdit) {
                textField.text = strText;
            }
            
            
            textField.placeholder = placeHolderString;
            
        }];
        
        [currentClass presentViewController:presentedViewController animated:YES completion:nil];
        
    }else{
        presentedAlertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:okButtonTitle, nil];
        presentedAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField *textField = [presentedAlertView textFieldAtIndex:0];
        if (isEdit)
            textField.text = strText;
        else
            textField.placeholder = placeHolderString;
        
        [presentedAlertView showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 0) {
                if (cancelBlock) {
                    cancelBlock();
                }
            }else if (buttonIndex == 1){
                
                if (okBlock) {
                    okBlock([alertView textFieldAtIndex:0].text);
                }
                
            }
        }];
    }
}




#pragma mark ActionSheet Method


+ (void)showActionSheetWithTitle:(NSString *)title
                          target:(id)currentClass
               cancelButtonTitle:(NSString *)cancelButtonTitle
                     cancelBlock:(MTAlertCancelBlock)cancelBlock
          destructiveButtonTitle:(NSString *)destructiveButtonTitle
                destructiveBlock:(MTAlertDestructiveBlock)destructiveBlock
               otherButtonsBlock:(MTAlerViewtOtherButtonsBlock)otherButtonsBlock
               otherButtonTitles:(NSString *)otherButtonTitles, ... {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
#if  TARGET_IPHONE_SIMULATOR
        [MTAlertController showWithAlertTitle:@"Sorry!!!" message:@"This functionality is not supported for ipad" target:self cancelButtonTitle:@"OK"];
#else
        NSLog(@"This functionality is not supported for ipad.");
#endif

        return;
    }
    
    if (NSClassFromString(@"UIAlertController")) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        
        if (cancelButtonTitle.length) {
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
                if (cancelBlock) {
                    cancelBlock();
                }

                [alertVC dismissViewControllerAnimated:YES completion:nil];
                
            }];
            [alertVC addAction:cancelAction];
        }
        
        if (destructiveButtonTitle.length) {
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){
                if (destructiveBlock) {
                destructiveBlock(destructiveButtonTitle);
                }
            }];
            [alertVC addAction:okAction];
        }
        
        
        va_list args;
        va_start(args, otherButtonTitles);
        int index =0 ;
        for (NSString *buttonTitle = otherButtonTitles; buttonTitle != nil; buttonTitle = va_arg(args, NSString*))
        {
            // Assumes that no "other button" titles match the Cancel or destructive button titles
            UIAlertAction* otherAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                if(otherButtonsBlock) {
                    otherButtonsBlock(buttonTitle,index);
                }
            }];
            [alertVC addAction:otherAction];
            index++;
        }
        va_end(args);
        
        
        [currentClass presentViewController:alertVC animated:YES completion:nil];
        
        
    } else {
        //For IOS 7 devices
        UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:title
                                                        delegate:nil
                                               cancelButtonTitle:cancelButtonTitle
                                          destructiveButtonTitle:destructiveButtonTitle
                                               otherButtonTitles:otherButtonTitles, nil];
        
        as.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        
        as.tapBlock = ^(UIActionSheet *actionSheet, NSInteger buttonIndex){
            
            if (buttonIndex == actionSheet.destructiveButtonIndex)
            {
                 if (destructiveBlock) {
                destructiveBlock([actionSheet buttonTitleAtIndex:buttonIndex]);
                 }
            } else if  (buttonIndex == actionSheet.cancelButtonIndex) {
                if (cancelBlock) {
                    cancelBlock();
                }

            } else {
                if(otherButtonsBlock) {
                    otherButtonsBlock([actionSheet buttonTitleAtIndex:buttonIndex],buttonIndex);
                }
            }
            
            
        };
        
        UIViewController *vc =currentClass;
        [as showInView:[vc view]];
        
    }
}



@end
