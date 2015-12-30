# MTAlertViewController
MTAlertViewController is designed to satisfy the both UIAlertview and UIActionsheet requirements for all ios version support.Apart from this we can able to name,rename ,forgot password the functionalities.
##Integration of MTAlertViewController to Project:
Drag MTAlertController folder to your app.
 #import "MTAlertController.h"
Write appropriate code by calling respective class method .
For your reference please had a look at below cases

case 1: Alertview Actions like YES or NO or Multiple.

 1:
 
 [MTAlertController showWithAlertTitle:@"Logout" message:@"Are you sure do you want to Signout now?" target:self cancelButtonTitle:@"No" cancelBlock:^{
        [MTAlertController showWithAlertTitle:@"No Action" message:@"No Action Pressed" target:self cancelButtonTitle:@"Ok"];
        
    } okButtonTitle:@"Yes" okBlock:^(NSString *userName) {
         [MTAlertController showWithAlertTitle:@"Yes Action" message:@"Yes Action Pressed" target:self okButtonTitle:@"Ok"];
    }];

2: 

  [MTAlertController showWithAlertTitle:@"Error!!" message:@"Please Enter Valid email id" target:self okButtonTitle:@"OK" okBlock:^(NSString *userName) {
       
        //you can write code for handle events here
        
    }];

3: 
  [MTAlertController showWithAlertTitle:@"MultiAlert" message:@"A new version of iTunes (12.3.2) is available. Would you like to download it now?" target:self cancelButtonTitle:@"Cancel" cancelBlock:^{
        //Handle Cancel code here
    } okButtonTitle:@"Download" okBlock:^(NSString *userName) {
        
        [MTAlertController showWithAlertTitle:@"Download" message:@"Download pressed" target:self okButtonTitle:@"OK"];
        
    } otherButtonsBlock:^(NSString *buttonName, NSInteger buttonIndex) {
        NSLog(@"%@ action pressed",buttonName);
        
    } otherButtonTitles:@"Don't Download",nil];


Case 2: Alert view with input text: it's basically used for  forgot password ,name and rename functionalities.
i)Forgot passowrd

  [MTAlertController showAlertWithIntputText:@"" placeHolder:@"please enter email adress" title:@"Forgot Password ???"  target:self isEdit:NO  okButtonTitle:@"Send" okBlock:^(NSString *userName) {
        if(userName.length > 0 ) {
            NSLog(@"%@",userName);
            
        }else {
            [MTAlertController showWithAlertTitle:@"Empty" message:@"Please enter email id" target:self cancelButtonTitle:@"OK"];
        }
        
    } cancelButtonTitle:@"Cancel" cancelBlock:^{
        //handle cancel pressed
        
    }];

2) Name Functionalities 

    [MTAlertController showAlertWithIntputText:@"" placeHolder:@"please enter suitcase name" title:@"Create suitcase"  target:self isEdit:NO okButtonTitle:@"Create" okBlock:^(NSString *userName) {
        if(userName.length > 0 ) {
            NSLog(@"created suitcase name is :%@",userName);
            
        }else {
            [MTAlertController showWithAlertTitle:@"Empty" message:@"Please enter suitcase name" target:self cancelButtonTitle:@"OK"];
        }

    } cancelButtonTitle:@"Cancel" cancelBlock:^{
        //handle cancel pressed

    }];


3) Rename Functionalities 

[MTAlertController showAlertWithIntputText:@"Mtuity COE" placeHolder:@"please enter suitcase name" title:@"Rename suitcase"  target:self isEdit:YES  okButtonTitle:@"Rename" okBlock:^(NSString *userName) {
        if(userName.length > 0 ) {
            NSLog(@"created suitcase name is :%@",userName);
            
        }else {
            [MTAlertController showWithAlertTitle:@"Empty" message:@"Please enter suitcase name" target:self cancelButtonTitle:@"OK"];
        }
        
    } cancelButtonTitle:@"Cancel" cancelBlock:^{
        //handle cancel pressed
        
    }];


3) Action Sheet which will support for only iphone version devices .

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

    }];


Notes : Action sheet will only support for iPhone , if you called in iPad it will automatically show an alert “This functionality is not available for this current device.”
