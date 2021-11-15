---
layout: page
title: RM2PT Case Study
permalink: /casestudy/atm/
typora-root-url: ../../../rm2pt-website
---

# Automated Teller Machine - ATM

ATM concerns the customer to withdraw and credit money. CoCoME mainly contains the scenarios of the cashier to process sales in supermarkets, and supermarket managers to manage the storage of products. LibMS primarily involves the student to borrow and return books. LoanPS touches the use cases of submitting and evaluating loan requests, booking a new loan and making the payment.

### Use Case Diagram

<img src="/imgs/atm-ucd.png" alt="Alt text" style="zoom: 50%;" /> 

### System Sequence Diagrams

<img src="/imgs/atm-ssd-withdraw.png" alt="Alt text" style="zoom: 50%;" />
<img src="/imgs/atm-ssd-deposit.png" alt="Alt text" style="zoom: 50%;" />

### Conceptual Class Diagram

<img src="/imgs/atm-ccd.png" alt="Alt text" style="zoom: 50%;" />

### Main Contracts of System Operations

```
//Contract ATMSystem::inputCard Skeleton
Contract ATMSystem::inputCard(cardid :Integer) : Boolean {

	/* definition skeleton */
	definition:
		bc:BankCard = BankCard.allInstance()->any(c:BankCard | c.CardID = cardid)

	/* precondition: skeleton */
	precondition:
		true

	/* postcondition: skeleton */
	postcondition:
		if
			(bc.oclIsUndefined() = false)
		then
			self.CardIDValidated = true and
			self.InputCard = bc and
			result = true
		else
			self.CardIDValidated = false and
			result = false
		endif
}

//Contract ATMSystem::inputPassword Skeleton
Contract ATMSystem::inputPassword(password : Integer) : Boolean {

	/* precondition: skeleton */
	precondition:
		self.CardIDValidated = true and
		self.InputCard.oclIsUndefined() = false

	/* postcondition: skeleton */
	postcondition:
		if
			self.InputCard.Password = password
		then
			self.PasswordValidated = true and
			return = true
		else
			self.PasswordValidated = false and
			return = false
		endif
}

//Contract ATMSystem::printReceipt Skeleton
Contract ATMSystem::printReceipt() : Real {

	/* precondition: skeleton */
	precondition:
		self.CardIDValidated = true and
		self.PasswordValidated = true and
		self.InputCard.oclIsUndefined() = false

	/* postcondition: skeleton */
	postcondition:
		if
			self.IsWithdraw = true
		then
			result = self.WithdrawedNumber
		else
			if
				self.IsDeposit = true
			then
				result = self.DepositedNumber
			else
				result = 0
			endif
		endif
}

//Contract ATMSystem::checkBalance Skeleton
Contract ATMSystem::checkBalance() : Real {

	/* precondition: skeleton */
	precondition:
		self.PasswordValidated = true and
		self.CardIDValidated = true and
		self.InputCard.oclIsUndefined() = false

	/* postcondition: skeleton */
	postcondition:
		result = self.InputCard.Balance
}

//Contract ATMSystem::ejectCard Skeleton
Contract ATMSystem::ejectCard() : Boolean {

	/* precondition: skeleton */
	precondition:
		self.PasswordValidated = true and
		self.CardIDValidated = true and
		self.InputCard.oclIsUndefined() = false

	/* postcondition: skeleton */
	postcondition:
		self.InputCard = null and
		self.PasswordValidated = false and
		self.CardIDValidated = false and
		self.IsWithdraw = false and
		self.IsDeposit = false and
		self.WithdrawedNumber = 0 and
		self.DepositedNumber = 0 and
		result = true
}

//Contract ATMSystem::withDraw Skeleton
Contract ATMSystem::withDraw(quantity : Integer) : Boolean {

	/* precondition: skeleton */
	precondition:
		self.PasswordValidated = true and
		self.CardIDValidated = true and
		self.InputCard.oclIsUndefined() = false and
		self.InputCard.Balance >= quantity

	/* postcondition: skeleton */
	postcondition:
		self.InputCard.Balance = self.InputCard.Balance@pre - quantity and
		self.WithdrawedNumber = quantity and
		self.IsWithdraw = true and
		result = true
}

//Contract ATMSystem::deposit Skeleton
Contract ATMSystem::deposit(quantity : Real) : Boolean {

	/* precondition: skeleton */
	precondition:
		self.PasswordValidated = true and
		self.CardIDValidated = true and
		self.InputCard.oclIsUndefined() = false and
		quantity >= 100

	/* postcondition: skeleton */
	postcondition:
		self.InputCard.Balance = self.InputCard.Balance@pre + quantity and
		self.IsDeposit = true and
		self.DepositedNumber = quantity and
		result = true
}
```

### ATM Download and Import to RM2PT

[Download RM2PT project - ATM](https://github.com/RM2PT/CaseStudies)
