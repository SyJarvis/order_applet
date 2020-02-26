python内置函数笔记

```
ext = filename.rsplit(".", 1)[1]
```

```
os.path.exists(save_dir)
```

```
import stat	权限，与os配合使用
os.chmod(save_dir, stat.S_IRWXU)
```

```
import uuid
file_name =  str(uuid.uuid4()).replace("-", "")+"."+ext
```

```
from decimal import Decimal
price
price = Decimal(price).quantize(Decimal('0.00'))
```

```
hasattr()函数用于判断对象是否包含对应的属性
hasattr(object, name)
object--对象
name--字符串、属性名
返回值：True or False
getattr
```

```
str(self.id).zfill(5)

tmp_food_ids = {}.fromkeys(tmp_food_ids).keys()
```



```
import_string = "from jobs.tasks.%s import JobTask as job_target" % (module_name)
exec(import_string, globals())
target = job_target()
target.run(ret_params)
```

```
import requests
headers = {'Content-Type':'application/json'}
r = requests.post(url=url, data=json.dumps(params), headers=headers)
r.encoding = 'utf-8'
r.text
r.json
```

15-6