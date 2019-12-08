#进阶5：分组查询

/*

	语法：
		select分组函数，列（要求出现在group bud的后面）
		from 表
		【where筛选条件】
		group by 分组的列表
		【order by字句】
	注意：
		查询列表必须特殊，要求是分组函数和group by后面出现的字段
特点：
	1、分组查询中筛选条件分为两类
	分组前筛选	原始表		位置			关键字
	分组后筛选	分组后的结果集	group by子句的前面	where
	分组后筛选	分组后的结果集	group by字句的后面	having
	
	①分组函数做条件肯定是放在having字句中
	②能用分组前筛选的就优先考虑使用分组前筛选
	2、group by字句支持单个字符分组，多个字段分组（多个字段之间用逗号隔开没有顺序要求），表达式或函数（用得较少）
	3、也可以添加排序（排序放在整个分组查询的最后）
	
	
*/

#引入：查询每个部门的平均工资
SELECT AVG(salary) AS 工资,`employee_id` FROM employees GROUP BY salary ORDER BY 工资;

#简单的分组查询
#案例1：查询每个工种的最高工资

SELECT MAX(salary),job_id
FROM employees
GROUP BY job_id;

#案例2：查询每个位置上的部门个数
SELECT COUNT(*),location_id
FROM departments
GROUP BY location_id;

#添加筛选条件
#案例1：查询邮箱中包含a字符的，每个部门的平均工资

SELECT AVG(salary),department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;

#案例2：查询有奖金的每个领导手下员工的最高工资

SELECT MAX(salary),manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;

#添加复杂的筛选条件

#案例1：查询那个部门的员工个数>2

#①查询每个部门的员工个数
SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id;

#②根据①的结果进行筛选，查询那个部门的员工个数>2

SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;

#案例2：查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资

#①查询每个工种有奖金的员工的最高工资
SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id;

#②根据①结果继续筛选，最高工资>12000

SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;

#案例3：查询领导编号>102的每个领导手下的最低工资>5000的领导编号是哪个，以及其最低工资

#①查询每个领导手下的员工固定最低工资

SELECT MIN(salary),manager_id
FROM employees
GROUP BY manager_id

#②添加筛选条件：编号>102
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id
GROUP BY manager_id

#③添加筛选条件：最低工资>5000
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id>102
GRANT BY manager_id
HAVING MIN(salary)>5000;














