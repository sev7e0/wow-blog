<#include "include/macros.ftl">
<@compress single_line=true>
<@header name="留言板 | ${config.siteName}"
    keywords="${config.siteName},留言板,原创博客留言,个人原创网站,个人技术博客"
    description="我的留言板,欢迎给我的个人原创博客留言 - ${config.siteName}"
    canonical="/guestbook" hasEditor=true>
</@header>

<div class="container custome-container">
    <nav class="breadcrumb">
        <a class="crumbs" name="返回首页" href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>留言板
    </nav>
    <div class="row guestbook-body">
        <@blogHeader name="留言板"></@blogHeader>
        <div class="col-sm-12 blog-main">
            <div class="blog-body expansion">
                <div class="alert alert-default alert-dismissible" role="alert" style="padding: 0px;">
                    <ul>
                        <li><i class="fa fa-heart fa-fw"></i> <strong>欢迎留言！</strong></li>
                        <li><i class="fa fa-heart fa-fw"></i> <strong>欢迎留言！</strong></li>
                        <li><i class="fa fa-heart fa-fw"></i> <strong>欢迎留言！</strong></li>
                        <li><i class="fa fa-hand-peace-o fa-fw"></i> <strong>重要的事情说三遍！</strong></li>
                    </ul>
                </div>
            </div>
        </div>
        <#if config.comment?if_exists && config.comment == 1>
            <div class="col-sm-12 blog-main">
                <div class="blog-body expansion">
                    <div id="comment-box" data-id="-1"></div>
                </div>
            </div>
        <#else>
            <div class="blog-body clear overflow-initial expansion gray">
                <i class="fa fa-close fa-fw"></i>评论功能已被站长关闭
            </div>
        </#if>
    </div>
</div>

<@footer>
    <script src="https://v1.hitokoto.cn/?encode=js&select=%23hitokoto" defer></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/simplemde/1.11.2/simplemde.min.js"></script>
</@footer>
</@compress>