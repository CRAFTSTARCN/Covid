# Covid
DATABASE Course Desigh，a COVID-19 Infomation System

## Warnnig! about usage

**PLEASE DONT SUBMIT IT AS HOMEWORK OR EXPERIMENT CODE!!**  
**请不要将其作为作业或实验代码提交！**  
**PLEASE DONT PUT IT ONLINE**  
**请不要将其做直接上线**

## About Code
Python3 & Django  
Mysql DataBase

### Database preparation
log in your mysql and run all code in 'createTable.sql'

### Enviroment
install python3 (minimium 3.7)  
then install django by  
(in console)
```
pip install django
```

### Setting
open file Covid/Covid/settings.py
do as settings said

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'YOUR_DATABASE_NAME',
        'USER': 'YOUR_USER',
        'PASSWORD': 'YOUR_PASS_WORD',
        'HOST': '',
        'PORT': '3306',
    }
}
```

remind: mysql default port:3306 if, reset the tocken in settings if chantged.

### run project
in console  
```
cd .../Covid
#get into the project dir
python manage.py runserver 0.0.0.0:8000
#8000 is your port
```  
and project will be run in 127.0.0.1:8000
