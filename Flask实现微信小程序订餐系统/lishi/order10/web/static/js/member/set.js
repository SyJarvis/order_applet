;
var member_set_ops = {
  init:function () {
      this.eventBind()
  },
    eventBind:function() {
      hnickname= $('.wrap_member_set input[name=nickname]').val()
    $(".wrap_member_set .save").click(function () {
        var btn_target = $(this)
        if (btn_target.hasClass('disabled')){
            common_ops.alert("正在处理，请不要重复提交");
            return;
        }
        nickname_target = $('.wrap_member_set input[name=nickname]')
        nickname = nickname_target.val()
        if (hnickname === nickname){
            common_ops.tip("请修改名称再保存", nickname_target)
            return;
        }
        id = $('.wrap_member_set input[name=id]').val()
        if (!nickname || nickname.length < 1){
            common_ops.tip("请填写名称再保存", nickname_target)
            return;
        }
        var data = {
            nickname:nickname,
            id:id
        };
        btn_target.addClass('disabled')
        $.ajax({
            url:common_ops.buildUrl('/member/set'),
            type:'POST',
            data:data,
            dataType:'json',
            success:function (res) {
                var callback = null;
                btn_target.removeClass('disabled')
                if (res == 200){
                    callback = function () {
                        window.location.href = common_ops.buildUrl('/member/index')
                    }
                }
                common_ops.alert(res.msg, callback)
            }
        })
    })
  }

};

$(document).ready(function () {
    member_set_ops.init()
});