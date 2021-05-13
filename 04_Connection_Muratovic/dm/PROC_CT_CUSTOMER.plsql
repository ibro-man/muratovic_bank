Create or replace procedure proc_ct_customer is
    v_cnt Number;
    
begin
select count(*) into v_cnt
from all_tables
where owner = 'demo' and
table_name = 'customer';

if v_cnt = 0 then
execute immediate'create table customer

                  (
                      customer_id integer,
                      email varchar(45),
                      firstname varchar(40),
                      lastname varchar(40),
                      gender varchar(20),
                      birthdate date,
                      credits decimal(10,2)                  
                  )';
                  commit;

end if;
select count (*) into v_cnt
from  all_sequences
where sequence_owner = 'demo' and
      sequence_name = 'seq_customer_id';

      if v_cnt = 0 then
            execute immediate 'create suquence seq_customer_id
                              start with 10000
                              increment by 1
                              cache 50';
      commit;
      end if;          
end proc_ct_customer;