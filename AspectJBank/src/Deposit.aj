/*
 * Copyright (c) 2023 Johannes Kepler University Linz
 *
 * Contributors:
 *   Hafiyyan Sayyid Fadhlillah -- Example of Bank Case Study using AspectJ
 *
 */

public aspect Deposit {
	
	private double fees = 100.0;
	pointcut depositWithFee(Account acc, Double depositAmount): call(void Account.depositBalance(Double)) && target(acc) && args(depositAmount);
	
	void around(Account acc, Double depositAmount): depositWithFee(acc, depositAmount){
		
		if(depositAmount <= fees) {
			System.out.println("Operation is cancelled. You need to deposit more than the fees. Current fee is "+ String.valueOf(fees)); 
		} else {
			Double finalDepAmount = depositAmount - fees;
			proceed(acc, finalDepAmount);
		}
		
	}
	
	
}