# Tomcat installation

```
---
- name: install tomcat
  hosts: all
  become: true

  tasks:
    - name: Install java 
      yum:
        name: java-11*
        state: present

    - name: Dowload tomcat file 
      get_url:
        url: https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz
        dest: /home/ec2-user/apache-tomcat-8.5.100.tar.gz
        mode: 744
  
    - name: Unzip tomcat file 
      unarchive:
        src: /home/ec2-user/apache-tomcat-8.5.100.tar.gz
        dest: /home/ec2-user/
        remote_src: yes
        mode: 744

    - name: Dowload Student.war file 
      get_url:
        url: https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war
        dest: /home/ec2-user/apache-tomcat-8.5.100/webapps/Student.war
    
    - name: Download SQL connector
      get_url:
       url: https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar
       dest: /home/ec2-user/apache-tomcat-8.5.100/lib/mysql-connector-java-8.0.19

    - name: Start tomcat service
      shell:  bash /home/ec2-user/apache-tomcat-8.5.100/bin/catalina.sh start

      ```
