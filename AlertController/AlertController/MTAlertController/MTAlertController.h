//
//  MTAlertController.h
//  AlertController
//
//  Created by Srinivas on 11/26/15.
//  Copyright © 2015 mtuity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^MTAlertCancelBlock)(void);

typedef void(^MTAlertOKBlock)(NSString* userName);

typedef void(^MTAlerViewtOtherButtonsBlock)(NSString* buttonName, NSInteger buttonIndex);

typedef void(^MTAlertDestructiveBlock)(NSString* buttonName);

@interface MTAlertController : NSObject

#pragma mark AlertView-Actions

+ (void)showWithAlertTitle:(NSString *)title
                      message:(NSString *)message
                    target:(id)currentClass
                cancelButtonTitle:(NSString *)cancelButtonTitle;


+ (void)showWithAlertTitle:(NSString *)title
                      message:(NSString *)message
                    target:(id)currentClass
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(MTAlertCancelBlock)cancelBlock;

+ (void)showWithAlertTitle:(NSString *)title
                      message:(NSString *)message
                    target:(id)currentClass
                okButtonTitle:(NSString *)okButtonTitle;

+ (void)showWithAlertTitle:(NSString *)title
                      message:(NSString *)message
                    target:(id)currentClass
                okButtonTitle:(NSString *)okButtonTitle
                      okBlock:(MTAlertOKBlock)okBlock;

+ (void)showWithAlertTitle:(NSString *)title
                      message:(NSString *)message
                    target:(id)currentClass
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(MTAlertCancelBlock)cancelBlock
                okButtonTitle:(NSString *)okButtonTitle
                      okBlock:(MTAlertOKBlock)okBlock;

+ (void)showWithAlertTitle:(NSString *)title
                      message:(NSString *)message
                    target:(id)currentClass
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(MTAlertCancelBlock)cancelBlock
                okButtonTitle:(NSString *)okButtonTitle
                      okBlock:(MTAlertOKBlock)okBlock
            otherButtonsBlock:(MTAlerViewtOtherButtonsBlock)otherButtonsBlock
            otherButtonTitles:(NSString *)otherButtonTitles, ... ;


#pragma mark AlertView Input Text

+(void)showAlertWithIntputText:(NSString*)strText
                   placeHolder:(NSString*)placeHolderString
                         title:(NSString*)title
                        target:(id)currentClass
                        isEdit:(BOOL)isEdit
                 okButtonTitle:(NSString*)okButtonTitle
                       okBlock:(MTAlertOKBlock)okBlock
             cancelButtonTitle:(NSString*)cancelButtonTitle
                   cancelBlock:(MTAlertCancelBlock)cancelBlock;

#pragma mark ActionSheet

+ (void)showActionSheetWithTitle:(NSString *)title
                          target:(id)currentClass
               cancelButtonTitle:(NSString *)cancelButtonTitle
                     cancelBlock:(MTAlertCancelBlock)cancelBlock
          destructiveButtonTitle:(NSString *)destructiveButtonTitle
                destructiveBlock:(MTAlertDestructiveBlock)destructiveBlock
               otherButtonsBlock:(MTAlerViewtOtherButtonsBlock)otherButtonsBlock
               otherButtonTitles:(NSString *)otherButtonTitles, ... ;
@end
