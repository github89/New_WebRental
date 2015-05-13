select * from board_test where rownum >= 1 order by idx desc as a;
select * from a whe


select *
from
(
select * from board_test order by idx desc
)
where a.rownum between 5 and 8

SELECT *
FROM (SELECT a.rownum as rnum, a.* FROM board_test a) as b
WHERE b.rnum BETWEEN 5 AND 9

select * from (select rownum rm, idx, title from board_test) where rm > 3 and rm <7;

select *
  from  
( select * 
    from board_test 
   order by idx desc ) 
 where ROWNUM > 5
 
 select * 
  from ( select /*+ FIRST_ROWS(n) */ 
  a.*, ROWNUM rnum 
      from ( select * from board_test , 
      with order by ) a 
      where ROWNUM <= 7 ) 
where rnum  >= 5;


select * from board_test order by idx;

select * from board_test  where idx <= 5 order by idx;


select *
from (select ROWNUM rnum,  idx, title, writer, regdate, count, content, regip
      from (select *
            from board_test
            order by idx desc)
      where ROWNUM <= 15)
where rnum >= 2 and rnum <=5;

select * 
			from (select ROWNUM rnum, idx, title, writer, regdate, count, content, regip
				from (select * 
            		from board_test 
            		order by idx desc) 
      		where ROWNUM <= 15) 
		where rnum >= 11





