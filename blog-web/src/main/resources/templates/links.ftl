<#include "include/macros.ftl">
<@compress single_line=true>
<@header title="友情链接 | ${config.siteName}"
    keywords="${config.siteName},友情链接交换"
    description="${config.siteName}，一个程序员的个人原创博客，友情链接交换"
    canonical="/links">
</@header>

<!--评论弹框-->
<div class="modal fade bs-example-modal-sm" id="auto-link-modal" tabindex="-1" role="dialog" aria-labelledby="auto-link-modal-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="auto-link-modal-label"><i class="fa fa-spinner fa-fw fa-spin"></i>自助申请友情链接</h4>
            </div>
            <div class="modal-body" style="overflow: hidden">
                <div class="alert alert-warning" role="alert">
                    <i class="fa fa-lightbulb-o"></i>友情提示：提交前请先添加本站友链，确认添加后再次提交申请，系统将自动审核！
                </div>
                <form class="form-horizontal col-sm-12" role="form" action="/api/autoLink" method="post" id="autoLinkForm" style="padding-left: 15px;">
                    <div class="form-group has-info">
                        <div class="input-group input-logo">
                            <input type="text" class="form-control" name="name" placeholder="${config.siteName}" style="padding-left: 88px;">
                            <span class="fa fa-user pull-left" aria-hidden="true" style="width: 75px;">站点名称</span>
                        </div>
                    </div>
                    <div class="form-group has-info">
                        <div class="input-group input-logo">
                            <input type="text" class="form-control" name="url" placeholder="本站链接所在的网页(内页或首页)" style="padding-left: 88px;">
                            <span class="fa fa-map-marker pull-left" aria-hidden="true" style="width: 75px;">站点地址</span>
                        </div>
                    </div>
                    <div class="form-group has-info">
                        <div class="input-group input-logo">
                            <input type="text" class="form-control" name="description" placeholder="一个程序员的个人博客。心之所向，无所不能。" style="padding-left: 88px;">
                            <span class="fa fa-commenting pull-left" aria-hidden="true" style="width: 75px;">站点描述</span>
                        </div>
                    </div>
                    <div class="form-group has-info">
                        <div class="input-group input-logo">
                            <input type="text" class="form-control" name="email" placeholder="选填" style="padding-left: 88px;">
                            <span class="fa fa-envelope pull-left" aria-hidden="true" style="width: 75px;">站长邮箱</span>
                        </div>
                    </div>
                    <div class="form-group has-info">
                        <div class="input-group input-logo">
                            <input type="text" class="form-control" name="favicon" placeholder="选填" style="padding-left: 88px;">
                            <span class="fa fa-file-image-o pull-left" aria-hidden="true" style="width: 75px;">站点图标</span>
                        </div>
                    </div>
                    <div class="form-group has-info">
                        <button type="button" class="btn btn-default btn-sm autoLink" data-loading-text="正在提交申请，请稍后..."><i class="fa fa-smile-o"></i>提交申请</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<@footer>
    <script type="text/javascript">
        $(function() {
            $("#autoLinkForm").bootstrapValidator({
                message: "输入值无效",
                feedbackIcons: {
                    valid: "fa fa-check",
                    invalid: "fa fa-remove",
                    validating: "fa fa-refresh"
                },
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: "站点名称不能为空"
                            }
                        }
                    },
                    url: {
                        validators: {
                            notEmpty: {
                                message: "站点地址不能为空"
                            },
                            uri: {
                                message: "不合法的地址"
                            }
                        }
                    },
                    email: {
                        validators: {
                            emailAddress: {
                                message: "不合法的邮箱地址"
                            }
                        }
                    },
                    description: {
                        validators: {
                            notEmpty: {
                                message: "站点描述不能为空"
                            }
                        }
                    },
                    favicon: {
                        validators: {
                            uri: {
                                message: "图标地址不合法"
                            }
                        }
                    }
                }
            });
            $(".autoLink").click(function() {
                var $thisBtn = $(this);
                var $form = $("#autoLinkForm");
                $form.bootstrapValidator("validate");
                if (_form.valid($form)) {
                    $thisBtn.button('loading');
                    $.ajax({
                        type: "POST",
                        url: $form.attr("action"),
                        data: $form.serialize(),
                        success: function (json) {
                            $.alert.ajaxSuccess(json);
                            $thisBtn.button('reset');
                        },
                        error: function (json) {
                            $.alert.ajaxError(json);
                            $thisBtn.button('reset');
                        }
                    })
                }
            })
        });
    </script>
    <script src="https://v1.hitokoto.cn/?encode=js&c=d&select=%23hitokoto" defer></script>
</@footer>
</@compress>