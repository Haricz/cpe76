//
//  main.m
//  CpE76_LE1
//
//  Created by SUELTO JOHN on 6/30/15.
//  Copyright (c) 2015 John Patrick B. Suelto. All rights reserved.
//


#import <Foundation/Foundation.h>

int getAccountNumber(int loginNum);
void deposit(int acct, double amt);
void withdraw(int acct, double amt);
void inquirebalance(int acct, double amt);
void getCoins(double amt);
void selection(int num);


struct customer {
    int accnumber;
    double balance;
};

typedef struct customer customer;

// declaration of independence
customer cstmr[2];
int quarters, loginNum, flag;
double amount = 00.00;


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        //insertion of default values
        cstmr[0].accnumber   =   23457;
        cstmr[0].balance     =   5645.89;
        
        cstmr[1].accnumber   =   37678;
        cstmr[1].balance     =   564.67;
        
        cstmr[2].accnumber =   56829;
        cstmr[2].balance   =   1235.35;
        
       int choice;
     
        
        NSLog(@"\n\n1. For deposit\n2. For witdrawal\n3. To check account balance\n4. To get quarters for parking");
        
        NSLog(@"\nEnter choice:");
        scanf("%i",&choice);
        
         
        while(1){
                
            if (choice == 4)
                break;
            
            NSLog(@"\n\nEnter customer number: ");
            scanf("%i",&loginNum);
            
            flag = getAccountNumber(loginNum);
            if(flag <= 2)
                break;
            else
                NSLog(@"\nERROR: Please enter a registered account number.");
        }
      
        selection(choice);
        
        
        
    }
    
    return 0;
}

void selection(int num){
    
    switch (num) {
            
        case 1:
            NSLog(@"Enter the amount to deposit: ");
            scanf("%lf",&amount);
            deposit(loginNum,amount);
            NSLog(@"New balance is: %.2lf",cstmr[flag].balance);
            break;
            
        case 2:
            while (true) {
                
                NSLog(@"Enter the amount to witdraw: ");
                scanf("%lf",&amount);
                if (amount > cstmr[flag].balance) {
                    NSLog(@"You don't have sufficient balance!");
                }
                else{
                    break;
                }
            }
            withdraw(loginNum,amount);
            NSLog(@"New balance is: %.2lf",cstmr[flag].balance);
            break;
            
        case 3:
            NSLog(@"Current balance is: %.2lf",cstmr[flag].balance);
            break;
            
        case 4:
            NSLog(@"Enter the amount to change: ");
            scanf("%lf",&amount);
            getCoins(amount);
            NSLog(@"%i",quarters);
            break;
            
        default:
            break;
    }

}

void deposit(int acct, double amt){
    
    cstmr[getAccountNumber(acct)].balance += amt;
}

void withdraw(int acct, double amt){
    
    cstmr[getAccountNumber(acct)].balance -= amt;
}

void inquirebalance(int acct, double amt){
    
 NSLog(@"New balance is: %.2lf",cstmr[getAccountNumber(acct)].balance);
    
}

void getCoins(double amt){
    
    quarters = amt/.25;
    
}

int getAccountNumber(int loginNum){
    
    int ctr = 0, flag=0;
    
    while(ctr < 3){
        
        if(loginNum == cstmr[ctr].accnumber)
            break;
        
        flag++;
        ctr++;
    }
    
    return flag;
}

