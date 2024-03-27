#KPI 1
#Year Wise Loan Amount 
use finance;  
select year(issue_d) as issue_year,count(loan_amnt) as Count_loan_amt,sum(loan_amnt) as Total_loan_amt,avg(loan_amnt)as Average_loan_amt,
min(loan_amnt) as Min_loan_amt,max(loan_amnt) as Max_loan_amt 
from finance_1 group by issue_year order by issue_year;


#KPI 2
      #    KPI 2 
#Grade & subgrade wise Revol_bal
select grade, sub_grade, sum(revol_bal) as Total_Revol_balance 
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade, sub_grade
order by grade, sub_grade;

#KPI 3
#Verified and non_Verified Loan Status

select F1.verification_status,sum(F2.total_pymnt) as Total_payment 
from finance_1 as F1 inner join finance_2 as F2 on F1.id=F2.id 
group by verification_status;

#KPI 4
#State wise and month wise loan status
select addr_state, last_credit_pull_d, loan_Status, count(loan_status) as total
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by addr_state, last_credit_pull_d, loan_status
order by last_credit_pull_d;

#KPI 5
#Home ownership Vs last payment date stats
select home_ownership, last_pymnt_d,concat("$",format(round(sum(last_pymnt_d)/10000,2),2),'K') as Total_payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by home_ownership, last_pymnt_d
order by last_pymnt_d desc, home_ownership desc;




