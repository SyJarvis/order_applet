10-6editor图片列表展示和分页多种方式实现



http://192.168.153.155:8999/upload/ueditor?action=uploadimage&encode=utf-8

```
1.设置返回参数
2.获取参数
3.参数校验
4.业务处理
5.返回应答
```



1. 生成图片表的ORM模型类	images

   ```
   flask-sqlacodegen 'mysql://root:mysql0220@127.0.0.1/food_db' --tables images --outfile "common/models/Image.py" --flask
   ```

   

```
uploadImage:resp = {'state':'SUCCESS', 'url':'', 'title':'', 'original':''}
listImage:resp = {'state':'SUCCESS', 'list':[], 'start':0, 'total':0}
```



listImage的分类问题：

```
/upload/ueditor?action=listimage&start=0&size=20&noCache=1582132303383 HTTP/1.1"
每一次返回的start的值会作为下一次请求的start参数值

```

返回的id值



```
if action == "listimage":
    # http://192.168.153.155:8999/upload/ueditor?action=uploadimage&encode=utf-8
    return listImage()
    
def listImage():
    # /upload/ueditor?action=listimage&start=0&size=20&noCache=1582132303383 HTTP/1.1"
    resp = {'state':'SUCCESS', 'list':[], 'start':0, 'total':0}
    req = request.values
    start = int(req['start']) if 'start' in req else 0
    page_size = int(req['size']) if 'size' in req else 0

    query = Image.query
    if start > 0:
        query = query.filter(Image.id < start)
    list = query.order_by(Image.id.desc()).offset(start).limit(page_size).all()
    images = []
    if list:
        for item in list:
            images.append({'url':UrlManager.buildImageUrl(item.file_key)})
            start = item.id
    resp['list'] = images
    resp['start'] = start
    resp['total'] = len(images)
    return jsonify(resp)
```

