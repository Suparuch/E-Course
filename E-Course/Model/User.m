//
//  User.m
//  TaLoomBoon
//
//  Created by Suparuch Sriploy on 7/27/14.
//  Copyright (c) 2014 Suparuch Sriploy. All rights reserved.
//

#import "User.h"
#import <Parse/Parse.h>

@implementation User


+ (void) loginWithSystem :(NSString *)email withPassword:(NSString *)password withDelegate:(id<UserDelegate>)delegate{
    
    
    [PFUser logInWithUsernameInBackground:email password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"successful login");
                                            // Callback - login successful
                                            if ([delegate respondsToSelector:@selector(userDidLogin:)]) {
                                                [delegate userDidLogin:YES];
                                            }
                                        } else {
                                            // The login failed. Check error to see why.'
                                            NSLog(@"login failed");
                                            
                                            // Callback - login failed
                                            if ([delegate respondsToSelector:@selector(userDidLogin:)]) {
                                                [delegate userDidLogin:NO];
                                            }
                                            
                                        }
                                    }];
    
}

- (void) createUserWithSystem :(id<UserDelegate>)delegate  andEmail:(NSString *)email andName:(NSString *)name andPassword:(NSString *)password image:(UIImage *)image gender:(NSString *)gender date:(NSString *)date phone:(NSString *)phone{
    
    //BOOL isCrateUser;
    
    // verifiedPassword
    //isCrateUser = [self verifiedPassword:password andConfirmPassword:confirmPassword];
    
    [self save:delegate andEmail:email andName:name andPassword:password photo:image gender:gender date:date  phone:phone];
}

/*
 *  verifiedPassword
 *  @param
 *  password = password
 *  confirmPassword = confirmPassword must same password
 */

- (BOOL) verifiedPassword:(NSString *)password andConfirmPassword:(NSString *)confirmPassword{
    
    BOOL isPasswordOk = NO;
    
    if ([password isEqualToString:confirmPassword]) {
        isPasswordOk = YES;
    }
    
    return isPasswordOk;
}

/*
 *  Save User Member Of TaLoomBon
 *  @param
 *  email = email adress
 *  name = nameofuser
 *  password = password
 */

- (void) save:(id<UserDelegate>)delegate andEmail:(NSString *)email andName:(NSString *)name andPassword:(NSString *)password photo:(UIImage *)image gender:(NSString *)gender date:(NSString *)date phone:(NSString *)phone {
    
    PFUser *user = [PFUser user];
    user.username = email;
    user.password = password;
    user.email = email;
    
    // other fields can be set just like with PFObject
    user[@"name"] = name;
    user[@"status"] = @"0";
    user[@"gender"] = gender;
    
    if (date != nil) {
        user[@"birthday"] = date;
    } else {
        user[@"birthday"] = [NSNull null];
    }
    
    if (phone != nil) {
        user[@"Phone"] = phone;
    } else {
        user[@"Phone"] = [NSNull null];
    }
    
    if (image != nil) {
        NSData *imageData = UIImagePNGRepresentation(image);
        PFFile *imageFile = [PFFile fileWithName:name data:imageData];
        [user setObject:imageFile forKey:@"image"];
    }
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Callback - Save successful
            if ([delegate respondsToSelector:@selector(userDidSaveSucceed:)]) {
                [delegate userDidSaveSucceed:YES];
            }
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"error %@",errorString);
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:errorString delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
            [alert show];
            
            [delegate userDidSaveSucceed:NO];
            // Show the errorString somewhere and let the user try again.
        }
        
    }];
}


+ (void) resetPassword:(NSString *)email {
    [PFUser requestPasswordResetForEmailInBackground:email];
}

// change your email
+ (void) newEmail:(NSString *)email changePassword:(NSString *)password reTypePassword:(NSString *)retype withDelegate:(id<UserDelegate>)delegate{
    if (![password isEqualToString:[PFUser currentUser].password] && ![password isEqualToString:retype]) {
        NSLog(@"Sorry Password is not correct");
        [delegate userdidChange:NO];
    } else if ([[PFUser user].username isEqualToString:email]){
        NSLog(@"Sorry new email already token");
        [delegate userdidChange:NO];
    } else {
        [[PFUser currentUser] setEmail:email];
        [[PFUser currentUser] saveInBackground];
        [delegate userdidChange:YES];
    }
}

// change password
+ (void) currentPassword:(NSString *)current changePassword:(NSString *)password retype:(NSString *)retype withDelegate:(id<UserDelegate>)delegate{
    
    if (![password isEqualToString:retype]){
        NSLog(@"Password is not equl");
        [delegate userdidchangePassWord:NO];
    } else if ([PFUser logInWithUsername:[PFUser currentUser].username password:current] && [password isEqualToString:retype]){
        [PFUser currentUser].password = password;
        [[PFUser currentUser] saveInBackground];
        [delegate userdidchangePassWord:YES];
    } else {
        [delegate userdidchangePassWord:NO];
    }
}

/*
 *  name :  approveClub
 *  des :   Admin approve new club request
 *  parum : addClub = objectId
 *
 */
+ (void) approveClub:(NSString *)addClub {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Club"];
    
    // Retrieve the object by id
    [query getObjectInBackgroundWithId:addClub block:^(PFObject *Club, NSError *error) {
        
        Club[@"approve"] = @YES;
        
        [Club saveInBackground];
        
    }];
}

/*
 *  name :  getClubRequert
 *  des :   Admin get all Club don't approve
 *  parum : addClub = club name
 *
 */
+ (NSArray *) getClubRequert {
    
    PFQuery *clubApprove = [PFQuery queryWithClassName:@"Club"];
    [clubApprove whereKey:@"approve" equalTo:@NO];
    
    NSArray *getClubDontApprove = [clubApprove findObjects];
    
    return getClubDontApprove;
}


/*
 *  name :  confirmBook
 *  des :   club owner accept user request book
 *  parum : bookId = objectId
 *
 */
+ (void) approveUserBook:(NSString *)bookId {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Book"];
    
    // Retrieve the object by id
    [query getObjectInBackgroundWithId:bookId block:^(PFObject *book, NSError *error) {
        
        book[@"approve"] = @YES;
        [book saveInBackground];
        
    }];
    
}

/*
 *  name :  disApproveUserBook
 *  des :   club owner reject user request book
 *  parum : bookId = objectId
 *
 */
+ (void) disApproveUserBook:(NSString *)bookId {
    
    PFObject *query = [PFObject objectWithoutDataWithClassName:@"Book" objectId:bookId];
    
    [query deleteInBackground];
}


/*
 *  name :  getUserDidBook
 *  des :   get all User did Request Book
 *
 */
+ (NSArray *) getUserRequertBook {
    
    PFQuery *UserDidBook = [PFQuery queryWithClassName:@"Book"];
    [UserDidBook whereKey:@"approve" equalTo:@NO];
    
    NSArray *getClubDontApprove = [UserDidBook findObjects];
    NSString *objectId = [PFUser currentUser].objectId;
    NSMutableArray *getResultUser = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < getClubDontApprove.count; i++) {
        if ([[[getClubDontApprove objectAtIndex:i]valueForKeyPath:@"userId.objectId"] isEqualToString:objectId]) {
            [getResultUser addObject:[getClubDontApprove objectAtIndex:i]];
        }
    }
    NSLog(@"getReust %@",getResultUser);
    
    return getClubDontApprove;
}


@end
