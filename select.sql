# 1.查询同时存在1课程和2课程的情况
select id,name 
from student as s join student_course as sc 
where s.id = sc.studentId and courseId = 1 and id in
    (select id 
    from student as s join student_course as sc 
    where s.id = sc.studentId and courseId = 2);
# 2.查询同时存在1课程和2课程的情况
select t.id,t.name 
from teacher as t join course as c 
where t.id = c.teacherId and t.id = 1 and t.id in 
    (select t.id
    from teacher as t join course as c 
    where t.id = c.teacherId and t.id = 2); 
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select id,name,avg(score) as avarage_score
from student as s join student_course as sc on s.id = sc.studentId
group by id,name
having avg(score) > 60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select *
from student as s
where not exists 
    (select s2.id 
    from student as s2 join student_course
    where s2.id=studentId and s.id=s2.id);
# 5.查询所有有成绩的SQL
select *
from student as s
where exists 
    (select s2.id 
    from student as s2 join student_course
    where s2.id=studentId and s.id=s2.id);
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select id,name 
from student as s join student_course as sc 
where s.id = sc.studentId and courseId = 1 and id in
    (select id 
    from student as s join student_course as sc 
    where s.id = sc.studentId and courseId = 2);
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select s.*
from student s join student_course on s.id = studentId  
where courseId = 1 and score < 60
order by score desc;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select c.id,c.name,avg(sc.score) avarage_score
from course c join student_course sc on c.id = sc.courseId
group by c.id,c.name
order by avarage_score desc,c.id;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name, sc.score
from student s join student_course sc join course c on s.id=sc.studentId and c.id = sc.courseId
where sc.score < 60 and c.name='数学';
