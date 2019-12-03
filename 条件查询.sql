# 进阶2：条件查询
/*

语法
	select 
		查询列表
	from
		表名
	where
		筛选条件
分类：
	一、按条件表达式筛选
	条件运算符：> < = != <> >= <=
	
	二、按逻辑表达式筛选
	逻辑运算符：
		&& || ！
		and or not
	&&和and:二个条件都为true,结果为true,反之为false
	||或or: 只要有一个条件为true,结果为true,反之为false
	!或not:	如果连接的条件本身为false,结果为true,反子为false
	三、模糊查询
		like
		between and
		in
		is null
*/
# 一、按条件表达式筛选
# 案例1：查询工资>12000的员工信息
SELECT	
	*
FROM
	`employees`
WHERE 
	salary>12000;

#案例2：查询部门编号不等于90的员工名和部门编号
SELECT	
	last_name,
	department_id
FROM
	employees
WHERE 
	department_id<>90;

# 二、按逻辑表达式筛选
#案例1：查询工资z在1000到2000之间的员工，工资以及奖金
SELECT
	last_name,
	salary,
	commission_pct
FROM
	employees
WHERE
	salary>=10000 AND salary<=20000;

#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT
	*
FROM
	employees
WHERE
	NOT(department_id>=90 AND department_id<=110) OR salary>1500;

# 三、模糊查询
/*
like
①一般和通配符一起使用
	通配符：
	%任意多个字符，包含0个字符
	_—任意单个字符
②
between and
in
is nll|is not null
*/
#1.like
SELECT
	*
FROM employees
WHERE 
	last_name LIKE '%a%';
#案例2：查询员工名中第三个字符为e，第五个字符为a的员工名和工资
SELECT
	last_name
	salary
FROM
	employees
WHERE
	last_name LIKE '_$_%' ESCAPE '$'
	
	
#2.between and
/*
①使用between and 可以提高语句的简洁度
②包含临界值
③二个临界值不要调换位置
*/

#案例1:查询员工编号100到120之间的员工信息

SELECT
	*
FROM
	employees
WHERE 
	employees_id >= 100 AND employees_id<=120;
# ---------------------------------------

SELECT
	*
FROM
	employees
WHERE 
	employees_id BETWEEN 100 AND 120;
	
	
#3.in
/*
含义：判断某字段的值是否属于in列表中的某一项
特点：
	①使用in提高语句简洁度
	②in列表的值类型必须一致或兼容
	③ 
*/
#案例：查询员工的工种编号是IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
SELECT
	last_name,
	job_id
FROM
	employees
WHERE	
	 job_id='IT_PROG' OR job_id = 'AD_VP' OR job_id = 'AD_PRES'

# ---------------------------------

SELECT
	last_name,
	job_id
FROM 
	employees 
WHERE
	job_id IN('IT_PROG', 'AD_VP', 'AD_PRES');
	
	
# 4、is null
/*

=或<>不能用于判断null值
is null或is not null 可以判断null值

*/
#案例1：查询没有奖金的员工和奖金率
SELECT 
	last_name,
	commission_pct
FROM 
	employees
WHERE 
	commission_pct IS NULL;
	
	
	
	
# 安全等于<=>	

#案例1：查询没有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct <=>NULL;
	
	
	
	
	
	
	
	