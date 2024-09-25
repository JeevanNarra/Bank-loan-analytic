select * from finance_1;
select * from finance_2;


/* year wise loan amount */

select year(issue_d) as year_of_issue_d, sum(loan_amnt) as total_loan_amount
from finance_1
group by year_of_issue_d
order by year_of_issue_d;


/*grade and sub grade wise revol_bal*/

select grade, sub_grade , sum(revol_bal) as tatal_revol_bal
from finance_1 inner join finance_2
on(finance_1.id=finance_2.id)
group by grade,sub_grade
order by grade,sub_grade;



/* total payment fros verified and non verified status*/

select verification_status , round(sum(total_pymnt))  as  total_payment
from finance_1 inner join finance_2
on (finance_1.id=finance_2.id)
group by verification_status; 


/* state wise last credit pull d wise loan status*/

select addr_state, last_credit_pull_d,loan_status
from finance_1 inner join finance_2
on (finance_1.id=finance_2.id)
group by addr_state,last_credit_pull_d,loan_status
order by addr_state;


/*home ownership vs last payment date status*/

select home_ownership, last_pymnt_d,concat('$',format(round(sum(last_pymnt_amnt)/10000,2),2),'k') as total_amount
from finance_1 inner join finance_2
on (finance_1.id=finance_2.id)
group by home_ownership,last_pymnt_d
order by last_pymnt_d desc,home_ownership desc;