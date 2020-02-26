10-3可视化编辑器ueditor配置

官网：http://ueditor.baidu.com/website/onlinedemo.html

```
web.static.plugins.ueditor
```



引入JS

```
<script src="{{buildStaticUrl('/plugins/ueditor/ueditor.config.js')}}"></script>
<script src="{{buildStaticUrl('/plugins/ueditor/ueditor.all.min.js')}}"></script>
<script src="{{buildStaticUrl('/plugins/ueditor/lang/zh-cn/zh-cn.js')}}"></script>
<script src="{{buildStaticUrl('/js/food/set.js')}}"></script>
```



html

```
<div class="col-lg-10">
<textarea  id="editor"  name="summary" style="height: 300px;"></textarea>
</div>
```

js

```
;
var food_set_ops = {
    init:function () {
        this.eventBind();
        this.initEditor()
    },
    eventBind:function () {

    },
    initEditor:function () {
        var that = this;
        that.ue = UE.getEditor('editor')
    }
};

$(document).ready(function () {
    food_set_ops.init()
})
```

```
that.ue = UE.getEditor('editor', {
            toolbars:[
        [ 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'strikethrough', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall',  '|','rowspacingtop', 'rowspacingbottom', 'lineheight'],
        [ 'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink'],
        [ 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'insertimage', 'insertvideo', '|',
            'horizontal', 'spechars','|','inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols' ]

    ],            
    	enableAutoSave:true,
        saveInterval: 60000,
        elementPathEnabled:false
        })
```





