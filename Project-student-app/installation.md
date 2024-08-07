Requirement
Port: 8080 22 3306
application/command : git, unzip

******** this is for linux OS, for ubuntu OS command may be change

--------------------------------------------------------------------------------------

download mysql/mariadb
```
sudo yum install mariadb-server -y
```
```
sudo systemctl start mariadb
```
```
sudo systemctl enable mariadb 
```
mysql_secure_installation
note: user name is root and set password for root user
login via root user
```
mysql -u root -p1234
```

**** create new database *****

```
mysql > create database <DATABASENAME>;              --- <DATABASENAME> = studentapp
****  create table under database  ****
mysql > use <DATABASENAME>;
mysql > CREATE TABLE if not exists students(student_id INT NOT NULL AUTO_INCREMENT,
	student_name VARCHAR(100) NOT NULL,
	student_addr VARCHAR(100) NOT NULL,
	student_age VARCHAR(3) NOT NULL,
	student_qual VARCHAR(20) NOT NULL,
	student_percent VARCHAR(10) NOT NULL,
	student_year_passed VARCHAR(10) NOT NULL,
	PRIMARY KEY (student_id)
);

```

mysql > exit
------------------------------------------------------------------------------------
download java [1.8]

 ```
yum install java-1.8* -y
```

----------------------------------------------------------------------------------
installation of tomcat

- download tomcat file 
	tomcat official site --> tomcat 8 --> zip file link copy --> on terminal download

```
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93.zip
```

*****   unnzip the file  *******

```
 unzip apache-tomcat-8.5.93.zip
```

```
cd apache-tomcat-8.5.93
```

for tomcat start 
```
 cd bin
```

make sh file executable (permission)
```
 chmod +x *.sh
```

tomcat start stop command
```
 ./catalina.sh stop
```
```
 ./catalina.sh start
```
------------------------------------------------------------------------------------

setup student application

```
 yum install git -y
```
```
 cd 
```
```
 git clone https://github.com/abhipraydhoble/Student_App-Project.git 
```
```
 cd apache-tomcat-8.5.93/bin
```
```
 ./catalina.sh stop
```

*** Copy file from git directory to Tomcat ***

```
cp StudentProject/student.war apache-tomcat-8.5.93/webapps/
```
```
 cp StudentProject/mysql-connector.jar apache-tomcat-8.5.93/lib/
```

**** modify context.xml

```
cd apache-tomcat-8.5.93/conf
```
```
vim context.xml
```
add below line at line 21
```
	      <Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource"
               maxTotal="100" maxIdle="30" maxWaitMillis="10000"
               username="USERNAME" password="PASSWORD" driverClassName="com.mysql.jdbc.Driver"
               url="jdbc:mysql://DB-ENDPOINT:3306/DATABASE"/>
```

------
replace above with
USERNAME	-- MYSQL USERNAME  EX. root
PASSWORD 	-- MYSQL PASSWORD  Ex. 1234
DB-ENDPOINT 	-- localhost       

****   Start tomcat  *******
```
 cd apache-tomcat-8.5.93/bin
```
```
 ./catalina.sh start
```
------------------------------------------------------------------------------

google hit
```
localhost:8080/student
```
or 
```
<IP>:8080/student
```
