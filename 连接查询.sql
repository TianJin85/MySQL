#进阶6：连接查询
/*
含义：又称多表查询，当查询的字段来自于多个表时，就会用到连接查询
笛卡尔乘积现象：表1 有m行，表2有n行，结果=m*n行

发生原因：没有有效的连接条件
如何避免：添加有效的连接条件

分类：
	按年代分类：
	sql92标准
	sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接
	
	按功能分类：
		内连接：等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全连接
		交叉连接
		
*/

SELECT * FROM beauty;
SELECT * FROM boys;

SELECT NAME,boyName FROM boys,beauty WHERE boys.`id`=beauty.`boyfriend_id`;

#一、sql92标准
#1、等值连接

#案例1：查询女神名和对应的男神名
SELECT NAME,boyName FROM boys,beauty WHERE boys.`id`=beauty.`boyfriend_id`;

#案例2：查询员工和对应的部门名

SELECT last_name,department_name
FROM employees,departments
WHERE employees.`employee_id`=departments.`department_id`

#2、为表起别名
/*
①提高语句的简洁度
②区分多个重名的字段
*/
#查询员工名、工种号、工种名

SELECT employees.`last_name`,employees.`job_id`,jobs.`job_title`
FROM employees,jobs
WHERE employees.`job_id`=jobs.`job_id`



