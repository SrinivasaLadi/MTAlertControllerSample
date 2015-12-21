//
//  MTAlertController.h
//  AlertController
//
//  Created by Srinivas on 11/26/15.
//  Copyright © 2015 mtuity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^MTAlertCancelBlock)(void);  //Cancel block
typedef void(^MTAlertOKBlock)(NSString* userName); //OK block
typedef void(^MTAlertOtherButtonsBlock)(NSInteger buttonIndex); //Action sheet Block

@interface MTAlertController : NSObject

/*!
 * @discussion It will show the alertview with textfeild
 * @param @strText it will show the renamable text if isText yes else  it will not in use
 * @param placeHolderString it will set the place holder string to text feild
 * @param title it will set to alert view title
 * @param okButtonTitle titleName
 * @param target should be current class self.
 * @param isText bool it will switch rename or input feature for text feild
 
 * @return cancel block and okaction were the blocks on respecive button actions

 */

+(void)showAlertWithEmailText:(NSString*)strText withPlaceHolder:(NSString*)placeHolderString andTitle:(NSString*)title andOkButtonTitle:(NSString*)okButtonTitle andtarget:(id)currentClass asText:(BOOL)isText andAlertCancelBlock:(MTAlertCancelBlock)cancelBlock andAlertOkBlock:(MTAlertOKBlock)okAction;


/*!
 * @discussion It will show the normal alertview with buttons
 * @param message which message has to show
 * @param title it will set to alert view title
 * @param okButtonTitle titleName
 * @param target should be current class self.
 * @param isText bool it will switch rename or input feature for text feild
 
 * @return cancel block and okaction were the blocks on respecive button actions
 
 */


+(void)showAlertWithMessage:(NSString*)message andTitle:(NSString*)title andOkButtonTitle:(NSString*)okButtonTitle andCancelTitle:(NSString*)cancleTitle andtarget:(id)currentClass andAlertCancelBlock:(MTAlertCancelBlock)cancelBlock andAlertOkBlock:(MTAlertOKBlock)okAction;

/*!
 * @discussion It will show the normal alertview with buttons
 * @param message which message has to show
 * @param title it will set to alert view title
 * @param okButtonTitle titleName
 * @param target should be current class self.
 * @param isText bool it will switch rename or input feature for text feild
 
 * @return cancel block and okaction were the blocks on respecive button actions
 
 */

+(void)showActionSheetTitles:(NSArray *) titleArray target:(id)currentClass withCancelBlock:(MTAlertCancelBlock)cancelBlock andAlertOKBlock:(MTAlertOtherButtonsBlock)okBlock;
@end
