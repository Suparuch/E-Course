//
//  User.h
//  TaLoomBoon
//
//  Created by Suparuch Sriploy on 7/27/14.
//  Copyright (c) 2014 Suparuch Sriploy. All rights reserved.
//
#import <Foundation/Foundation.h>
@import UIKit;

@protocol UserDelegate <NSObject>
@optional

- (void) userDidLogin:(BOOL)loggedIn;
- (void) userDidSaveSucceed:(BOOL)isSaveSucceed;
- (void) userUploadImageComplete:(BOOL)success;
- (void) userdidChange:(BOOL)didChange;
- (void) userdidchangePassWord:(BOOL)success;

@end

@interface User : NSObject 

+ (void) loginWithSystem :(NSString *)email withPassword:(NSString *)password withDelegate:(id<UserDelegate>)delegate;
- (void) createUserWithSystem :(id<UserDelegate>)delegate  andEmail:(NSString *)email andName:(NSString *)name andPassword:(NSString *)password image:(UIImage *)image gender:(NSString *)gender date:(NSString *)date phone:(NSString *)phone;
- (BOOL) verifiedPassword:(NSString *)password andConfirmPassword:(NSString *)confirmPassword;
+ (void) resetPassword:(NSString *)email;
+ (void) newEmail:(NSString *)email changePassword:(NSString *)password reTypePassword:(NSString *)retype withDelegate:(id<UserDelegate>)delegate;
+ (void) currentPassword:(NSString *)current changePassword:(NSString *)password retype:(NSString *)retype withDelegate:(id<UserDelegate>)delegate;
+ (NSArray *) getClubRequert;
+ (void) approveClub:(NSString *)addClub;
+ (NSArray *) getUserRequertBook;
+ (void) approveUserBook:(NSString *)bookId;
+ (void) disApproveUserBook:(NSString *)bookId;

@end
