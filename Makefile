reset:
	sudo mysql --defaults-file=/etc/mysql/debian.cnf -e "DROP DATABASE IF EXISTS drupal7;"
	sudo mysql --defaults-file=/etc/mysql/debian.cnf -e "CREATE DATABASE drupal7;"
	sudo mysql --defaults-file=/etc/mysql/debian.cnf -e "GRANT ALL PRIVILEGES ON drupal7.* TO 'drupal7'@'localhost' IDENTIFIED BY 'drupal7';"
	sudo mysql --defaults-file=/etc/mysql/debian.cnf -e "FLUSH PRIVILEGES;"
	sudo mysql --defaults-file=/etc/mysql/debian.cnf drupal7 < work/drupal7.dump
