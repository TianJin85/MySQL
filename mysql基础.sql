#进阶1：基础查询
/*
 语法：
 selcet 查询列表 from 表名；
 特点：
 1、查询列表可以是：表中的字段，常量值，表达式，函数
 2、查询的结果是一个虚拟的表格 
 */
#1.查询表中的单个字段
USE myemployees;
# 方式1
# 方式2
SELECT * FROM employees;
#4.查询常量
SELECT 100;
SELECT 'john';

# 5.查询表达式
SELECT 100%98;

# 6.查询函数
SELECT VERSION();

# 7.别名
/*
 * 1.便于理解
 * 2.如果要查询的字段有重名的情况，使用别名可以区分开来
 */
# 方式一：使用as
SELECT 100%98 AS 结果;
SELECT last_name AS 姓, first_name AS 名 FROM empleyees;

# 方式二
SELECT last_naem 姓,first_name 名 FROM employees;

# 案例：查询salary,显示结果为out put
SELECT salary AS "out put" FROM employees;

# 8.去重

# 案例：查询员工表中涉及到的所有的不门编号
SELECT DISTINCT department_id FROM employees;

# 案例:查询员工名和姓连接成一个字段，并显示为姓名
SELECT
		last_name + first_name AS 姓名
FROM
		employees;