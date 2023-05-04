/*
 * Copyright (c) 2023 Johannes Kepler University Linz
 *
 * Contributors:
 *   Hafiyyan Sayyid Fadhlillah -- Example of Bank Case Study using DeltaJava
 *
 */

package at.jku.kv.ple;

public class BankSimulation {
	public static void main(String[] args) {
		
		Bank internationalBank = new Bank("International Bank");
		
		Account acc1 = new Account("David", "AT123");
		Account acc2 = new Account("Tanjiro", "JP123");
		Account acc3 = new Account("Donny", "US123", 300.0);
		
		internationalBank.registerAccount(acc3);
		
		acc3.checkBalance();
		
	}
}

