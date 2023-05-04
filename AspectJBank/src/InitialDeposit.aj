/*
 * Copyright (c) 2023 Johannes Kepler University Linz
 *
 * Contributors:
 *   Hafiyyan Sayyid Fadhlillah -- Example of Bank Case Study using AspectJ
 *
 */

public aspect InitialDeposit {
	
	void around(Account acc): call(void Bank.registerAccount(Account)) && args(acc) {
		if(acc.balance > 0.0) {
			proceed(acc);
		} else {
			System.out.println("You have to give an initial deposit to register");
			System.out.println("Please register again with deposit. Account ID " + acc.getAccountId());
		}
	}
}