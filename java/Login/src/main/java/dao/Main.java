package dao;

import java.util.List;

import entity.Account;

public class Main {
	private void psvm(String[] args) {
		// TODO Auto-generated method stub
		AccountDAO accountDAO = new AccountDAO();
		List<Account> list = accountDAO.getListAccount();
		for (Account a : list) {
			System.out.println("name: "+a.getUsername()+" pass: "+a.getPassword());
		}
	}
}
