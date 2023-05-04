/*
 * Copyright (c) 2023 Johannes Kepler University Linz
 *
 * Contributors:
 *   Hafiyyan Sayyid Fadhlillah -- Example of Bank Case Study using AspectJ
 *
 */

public aspect Withdrawal {
	
	private double fees = 100.0;
	
	void around(Account acc, Double withdrawalAmount): call(void Account.withdrawBalance(Double)) 
														&& args(withdrawalAmount) && target(acc) {
		
		if(acc.balance < fees){
			System.out.println("Operation is cancelled. You need to have more balance than the fees. Current fee is "+ String.valueOf(fees));
		} else if (acc.balance < (fees + withdrawalAmount)) {
			System.out.println("Operation is cancelled. You need to have more balance than the fees and withdrawal amount. Current fee is "+ String.valueOf(fees));
		} else {
			Double withdrawTotal = withdrawalAmount + fees;
			proceed(acc, withdrawTotal);
		}
		
	}
	
	
}