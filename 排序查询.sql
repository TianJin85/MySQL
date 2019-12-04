# 进阶3：排序查询

/*
引入：
	SELECT * FROM employees;
语法：
	select 查询列表
	from表
	[where筛选条件]
	order by 排序列表[asc|desc]
特点：
	1、asc代表的升序，desc代表的是降序
	如果不写，默认是升序
	2、order by 字句中科院支持单个字段、多个字段、表达式、函数
	3、order by 字句一般是放在查询语句的最后面，limit除外
*/
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary 


# 案例2：查询部门编号>=90的员工信息，a按入职时间的先后进行排序[添加筛选条件]

SELECT *
FROM employees
WHERE department_id>=90
ORDER BY hiredate ASC;

# 案例3：按年薪的高低显示员工的信息和年薪[按表达式排序]

SELECT *,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM employees
ORDER BY salary*12*(1+IFNULL(commission_pct,0)) DESC;

#案例4：按年薪的高低显示员工的信息和年薪[按别名排序]
SELECT *,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM employees
ORDER BY 年薪 DESC;
