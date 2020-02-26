flask方法



make_response 

```
response.delete_cookie(app.config['AUTH_COOKIE_NAME'])
response.set_cookie(app.config['AUTH_COOKIE_NAME'], "%s#%s"%(UserService.geneAuthCode(user_info), user_info.uid))
```

