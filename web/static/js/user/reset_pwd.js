;
var user_resetPwd_ops = {
    init:function () {
        this.eventBind();
    },
    eventBind:function () {
        $('.user_reset_pwd_wrap #save').click(function () {

            var btn_target = $(this)
            if (btn_target.hasClass('disabled')){
                common_ops.alert("正在处理！！请不要重复提交")
                return;
            }
            old_password_target = $('.user_reset_pwd_wrap input[name=old_password]');
            old_password = old_password_target.val();
            new_password_target = $('.user_reset_pwd_wrap input[name=new_password]');
            new_password = new_password_target.val();

            if (!old_password || old_password.length < 2){
                common_ops.tip("请输入符合规范的密码", old_password_target);
                return;
            }

            if (!new_password || new_password.length < 2){
                common_ops.tip("请输入符合规范的密码", new_password_target);
                return;
            }

            if (new_password === old_password){
                common_ops.alert("原密码与新密码不能相同，请重新输入");
                return;
            }

            btn_target.addClass("disabled");

            var data = {
                new_password:new_password,
                old_password:old_password
            }


            $.ajax({
                url:common_ops.buildUrl('/user/reset-pwd'),
                type:'POST',
                data:data,
                dataType:'json',
                success:function (res) {
                    btn_target.removeClass('disabled');
                    var callback = null;
                    if (res.code == 200){
                        callback = function () {
                            window.location.href = common_ops.buildUrl('/')
                        }
                    }
                    common_ops.alert(res.msg, callback)
                }
            })

        });
    }
};

$(document).ready(function () {
    user_resetPwd_ops.init();
});
