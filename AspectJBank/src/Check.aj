/*
 * Copyright (c) 2023 Johannes Kepler University Linz
 *
 * Contributors:
 *   Hafiyyan Sayyid Fadhlillah -- Example of Bank Case Study using AspectJ
 *
 */

public aspect Check {
	
	private double fees = 100.0;
	pointcut checkWithFee(Account acc): call(void Account.checkBalance()) && target(acc);
	pointcut getWithFee(Account acc): call(Double Account.getBalance()) && target(acc);
	
	void around(Account acc): checkWithFee(acc){
		
		if(acc.balance < fees){
			System.out.println("Operation is cancelled. Your account does not have enough balance to pay the fee. Current fee is "+ String.valueOf(fees));
		} else {
			System.out.println("Old balance is: "+ String.valueOf(acc.balance));
			acc.balance -= fees;
			System.out.println("Your balance is: " + String.valueOf(acc.balance));
		}
	}
	
}