MySQL 数据库定时备份

```bash
00 20 * * 6 mysqldump -h127.0.0.1 -P3306 -uroot -pmysql --all-database > /data/FromMySQL/all.sql && rsync -vr -e 'sshpass -p "abc@123" ssh' /data/FromMySQL/ fl@192.168.1.135:/data/FromMySQL/
```
