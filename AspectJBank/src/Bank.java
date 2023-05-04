/*
 * Copyright (c) 2023 Johannes Kepler University Linz
 *
 * Contributors:
 *   Hafiyyan Sayyid Fadhlillah -- Example of Bank Case Study using AspectJ
 *
 */

import java.util.HashMap;
import java.util.Map;


public class Bank {
	
	Map<String, Account> customersList;
	String bankName;
	
	public Bank(String bankName) {
		super();
		this.bankName = bankName;
		this.customersList = new HashMap<String, Account>();
	}

	String getBankName() {
		return bankName;
	}
	
	Account getAccountWithAccountID(String accountId) {
		return this.customersList.get(accountId);
	}
	
	void saveAccountInformation(Account acc) {
		this.customersList.put(acc.getAccountId(), acc);
	}
	
	void updateAccountInfo(Account acc) {
		String accId = acc.getAccountId();
		
		if(this.customersList.containsKey(accId)) {
			this.saveAccountInformation(acc);
		} else {
			System.out.println("This account is not yet registered. Please register first.");
		}
	}
	
	void registerAccount(Account acc){
		
		String accId = acc.getAccountId();
		
		if(customersList.containsKey(accId)) {
			System.out.println("This account already exist, updating the information instead");
			
		}
		
		saveAccountInformation(acc);
	
	}
	
}