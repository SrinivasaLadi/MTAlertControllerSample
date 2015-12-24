//
//  ViewController.m
//  AlertController
//
//  Created by Srinivas on 11/26/15.
//  Copyright © 2015 mtuity. All rights reserved.
//

#import "ViewController.h"
#import "MTAlertController.h"
@interface ViewController ()

- (IBAction)btnLogoutPressed:(id)sender;
- (IBAction)btnEmailValidationPressed:(id)sender;
- (IBAction)btnMultiAlertPressed:(id)sender;
- (IBAction)btnCreateSuitCasePressed:(id)sender;
- (IBAction)btnRenameSuitCasePressed:(id)sender;
- (IBAction)btnForgotPasswordPressed:(id)sender;
- (IBAction)selectPhotoClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark AlertView-message-Methods


- (IBAction)btnLogoutPressed:(id)sender {
    
    [MTAlertController showWithAlertTitle:@"Logout" message:@"Are you sure do you want to Signout now?" target:self cancelButtonTitle:@"No" cancelBlock:^{
        [MTAlertController showWithAlertTitle:@"No Action" message:@"No Action Pressed" target:self cancelButtonTitle:@"Ok"];
        
    } okButtonTitle:@"Yes" okBlock:^(NSString *userName) {
         [MTAlertController showWithAlertTitle:@"Yes Action" message:@"Yes Action Pressed" target:self okButtonTitle:@"Ok"];
    }];
    
}



- (IBAction)btnEmailValidationPressed:(id)sender {
    
    [MTAlertController showWithAlertTitle:@"Error!!" message:@"Please Enter Valid email id" target:self okButtonTitle:@"OK" okBlock:^(NSString *userName) {
       
        //you can write code for handle events here
        
    }];
}

- (IBAction)btnMultiAlertPressed:(id)sender {
    
    [MTAlertController showWithAlertTitle:@"MultiAlert" message:@"A new version of iTunes (12.3.2) is available. Would you like to download it now?" target:self cancelButtonTitle:@"Cancel" cancelBlock:^{
        //Handle Cancel code here
    } okButtonTitle:@"Download" okBlock:^(NSString *userName) {
        
        [MTAlertController showWithAlertTitle:@"Download" message:@"Download pressed" target:self okButtonTitle:@"OK"];
        
    } otherButtonsBlock:^(NSString *buttonName, NSInteger buttonIndex) {
        NSLog(@"%@ action pressed",buttonName);
        
    } otherButtonTitles:@"Don't Download",nil];
}

#pragma mark AlertView Input Text

- (IBAction)btnCreateSuitCasePressed:(id)sender {

    
    [MTAlertController showAlertWithIntputText:@"" placeHolder:@"please enter suitcase name" title:@"Create suitcase"  target:self isEdit:NO okButtonTitle:@"Create" okBlock:^(NSString *userName) {
        if(userName.length > 0 ) {
            NSLog(@"created suitcase name is :%@",userName);
            
        }else {
            [MTAlertController showWithAlertTitle:@"Empty" message:@"Please enter suitcase name" target:self cancelButtonTitle:@"OK"];
        }

    } cancelButtonTitle:@"Cancel" cancelBlock:^{
        //handle cancel pressed

    }];
    
    
}

- (IBAction)btnRenameSuitCasePressed:(id)sender {
   
    [MTAlertController showAlertWithIntputText:@"Mtuity COE" placeHolder:@"please enter suitcase name" title:@"Rename suitcase"  target:self isEdit:YES  okButtonTitle:@"Rename" okBlock:^(NSString *userName) {
        if(userName.length > 0 ) {
            NSLog(@"created suitcase name is :%@",userName);
            
        }else {
            [MTAlertController showWithAlertTitle:@"Empty" message:@"Please enter suitcase name" target:self cancelButtonTitle:@"OK"];
        }
        
    } cancelButtonTitle:@"Cancel" cancelBlock:^{
        //handle cancel pressed
        
    }];

}

- (IBAction)btnForgotPasswordPressed:(id)sender {
    
    [MTAlertController showAlertWithIntputText:@"" placeHolder:@"please enter email adress" title:@"Forgot Password ???"  target:self isEdit:NO  okButtonTitle:@"Send" okBlock:^(NSString *userName) {
        if(userName.length > 0 ) {
            NSLog(@"%@",userName);
            
        }else {
            [MTAlertController showWithAlertTitle:@"Empty" message:@"Please enter email id" target:self cancelButtonTitle:@"OK"];
        }
        
    } cancelButtonTitle:@"Cancel" cancelBlock:^{
        //handle cancel pressed
        
    }];
    
}


#pragma mark ActionSheet

- (IBAction)selectPhotoClicked:(id)sender {
    [MTAlertController showActionSheetWithTitle:@"Select photo" target:self cancelButtonTitle:@"Cancel" cancelBlock:^{
        
        //Write cancel action here
        
    } destructiveButtonTitle:NULL destructiveBlock:nil otherButtonsBlock:^(NSString *buttonName, NSInteger buttonIndex) {
        
        switch (buttonIndex) {
                            case 0:
                                NSLog(@"Take Photo Clicked");
                                break;
                
                            case 1:
                                NSLog(@"Choose From Gallery");
                                break;
                
                
                            default:
                                break;
                        }

        
    } otherButtonTitles:@"Take Photo",@"Choose From Gallery", nil];
    
}
@end
