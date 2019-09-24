<#include "include/macros.ftl">
<@header name="${article.title} | ${config.siteName}" keywords="${article.keywords?if_exists},${config.siteName}" description="${article.description?if_exists}" canonical="/article/${article.id}" hasEditor=true></@header>
<#if article.coverImage?exists>
    <img src="${article.coverImage?if_exists}" onerror="this.src='${config.staticWebSite}/img/default_article_cover.jpg'" style="display: none;" id="cover-img">
</#if>
<div class="container custome-container">
    <nav class="breadcrumb">
        <a class="crumbs" name="返回首页" href="${config.siteUrl}"  data-placement="bottom"><i class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>
        <a href="${config.siteUrl}/type/${article.typeId}" data-title="点击查看该分类文章" data-toggle="tooltip" data-placement="bottom">${article.type.name}</a>
        <i class="fa fa-angle-right"></i>
    </nav>
    <div class="row article-body">
        <div class="col-sm-8 blog-main">
            <div class="blog-body overflow-initial fade-in">
                <div class="article-flag">
                    <#if article.original?string('true','false') == 'true'>
                        <span class="article-blockquote article-blockquote-green"></span>
                        <span class="article-original article-original-green">
                            <a href="${config.siteUrl}/article/${article.id}"  data-placement="bottom">原创</a>
                        </span>
                    <#else>
                        <span class="article-blockquote article-blockquote-red"></span>
                        <span class="article-original article-original-red">
                            <#if article.originalUrl??>
                                <a href="${article.originalUrl}" data-original-title="点击查看原文章" target="_blank" rel="external nofollow" data-toggle="tooltip" data-placement="bottom">转载</a>
                            <#else >
                                <a href="javascript:void(0);" data-original-title="暂未找到原文章链接" data-toggle="tooltip" data-placement="bottom">转载</a>
                            </#if>

                        </span>
                    </#if>
                    <div class="blog-info-meta pull-right">
                        <ul class="list-unstyled list-inline">
                            <li><i class="fa fa-clock-o fa-fw"></i>${article.createTime?string('yyyy-MM-dd')}</li>
                            <li><i class="fa fa-eye fa-fw"></i><a class="pointer" data-original-title="${article.lookCount!(0)}人浏览了该文章"  data-placement="bottom">浏览 (<num>${article.lookCount!(0)}</num>)</a></li>
                            <li><a href="#comment-box" data-original-title="${article.commentCount!(0)}人评论了该文章"  data-placement="bottom"><i class="fa fa-comments-o fa-fw"></i>评论 (${article.commentCount!(0)})</a></li>
                        </ul>
                    </div>
                </div>
                <div class="blog-info overflow-initial">
                    <h1 class="blog-info-title">
                        <strong>${article.title}</strong>
                    </h1>
                    <div class="blog-info-body ${article.isMarkdown?string('markdown-body editor-preview-active-side', '')}">
                        ${article.content}
                        <#if article.original?string('true','false') == 'true'>
                            <div align="center">
                                <img src="https://files.sev7e0.site/images/logo.gif" alt="sev7e0" width="200">
                                <br>
                                <sub>Write by
                                    <a href="https://github.com/sev7e0">sev7e0</a>
                                </sub>
                            </div>
                        </#if>

                    </div>
                    <div class="separateline"><span>end</span></div>
                    <div id="social" style="margin-bottom: 45px;">
                        <div class="social-main">
                            <span class="like">
                                <a href="javascript:;" data-id="${article.id?c}" name="点赞" ><i class="fa fa-thumbs-up"></i>赞 <i class="count"> ${article.loveCount!(0)}</i> </a>
                            </span>
                            <div class="shang-p">
                                <div class="shang-empty"><span></span></div>
                                <span class="shang-s"><a onclick="PaymentUtils.show();" style="cursor:pointer">赏</a> </span>
                            </div>
                            <div class="share-sd">
                                <span class="share-s"><a href="javascript:void(0)" id="share-s" name="分享"><i class="fa fa-share-alt"></i>分享</a></span>
                                <div id="share" style="display: none">
                                    <ul class="bdsharebuttonbox bdshare-button-style1-16" data-bd-bind="1516426362121">
                                        <li><a name="分享到微博" class="fa fa-weibo" data-cmd="tsina" onclick="return false;" href="#"></a></li>
                                        <li><a name="分享到微信" class="fa fa-weixin" data-cmd="weixin" onclick="return false;" href="#"></a></li>
                                        <li><a name="更多" class="bds_more fa fa-plus-square" data-cmd="more" onclick="return false;" href="#"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="article-footer overflow-initial">所属分类：<a href="${config.siteUrl}/type/${article.typeId}" data-original-title="点击查看${article.type.name}分类的文章" data-toggle="tooltip" data-placement="bottom">${article.type.name}</a></div>
                </div>
            </div>
            <div class="blog-body article-tag">
                <div class="cat">
                    <ul class="list-unstyled">
                        <li>
                            <strong>本文标签：</strong>
                                <#list article.tags as item>
                                    <a href="${config.siteUrl}/tag/${item.id?c}" class="c-label" data-original-title="点击查看${item.name}相关文章" data-toggle="tooltip" data-placement="bottom" target="_blank">${item.name}</a>
                                </#list>
                        </li>
                        <li>
                            <strong>版权声明：</strong>
                            <#if article.original?string('true','false') == 'true'>
                            本站原创文章，于${article.createTime?string('yyyy年MM月dd日')}由<a href="${config.siteUrl}" target="_blank" data-original-title="${config.siteName}" data-toggle="tooltip" data-placement="bottom"><strong>${config.authorName}</strong></a>发布，转载请注明出处
                            <#else>
                            本文为互联网转载文章，文章开头处点击<strong>转载</strong>可查看原文链接(部分除外)。如果侵权，请<a target="_blank" href="mailto:sev7e0@gmail.com" data-toggle="tooltip" data-title="点击给我发邮件" data-placement="bottom"><strong>联系本站长</strong></a>删除，谢谢。
                            </#if>
                        </li>
                    </ul>
                </div>
            </div>
            <!--隐藏广告-->
            <!--<div class="blog-body">
                <a href="https://promotion.aliyun.com/ntms/act/ambassador/sharetouser.html?userCode=wylo59db&utm_source=wylo59db" target="_blank" rel="external nofollow">
                    <img src="${config.staticWebSite}/img/ad/aliyun_sale1000-60.png" alt="" class="img-responsive" style="width: 100%;">
                </a>
            </div>-->
            <div class="blog-body prev-next">
                <nav class="nav-single wow" data-wow-delay="0.3s">
                    <#if other.prev>
                        <a href="${config.siteUrl}/article/${other.prev.id}" rel="prev">
                            <span class="meta-nav" data-original-title="${other.prev.title}" data-toggle="tooltip" data-placement="bottom"><span class="post-nav"><i class="fa fa-angle-left"></i> 上一篇</span>
                                <br>${other.prev.title}
                            </span>
                        </a>
                    <#else >
                        <a href="javascript:void(0)" rel="nofollow prev">
                            <span class="meta-nav" data-original-title="已经到第一篇了" data-toggle="tooltip" data-placement="bottom"><span class="post-nav"><i class="fa fa-angle-left"></i> 上一篇</span>
                                <br>已经到第一篇了
                            </span>
                        </a>
                    </#if>
                    <#if other.next>
                        <a href="${config.siteUrl}/article/${other.next.id}" rel="next">
                            <span class="meta-nav" data-original-title="${other.next.title}" data-toggle="tooltip" data-placement="bottom"><span class="post-nav">下一篇 <i class="fa fa-angle-right"></i></span>
                                <br>${other.next.title}
                            </span>
                        </a>
                    <#else >
                        <a href="javascript:void(0)" rel="nofollow next">
                            <span class="meta-nav" data-original-title="已经到最后一篇了" data-toggle="tooltip" data-placement="bottom"><span class="post-nav">下一篇 <i class="fa fa-angle-right"></i></span>
                                <br>已经到最后一篇了
                            </span>
                        </a>
                    </#if>
                    <div class="clear"></div>
                </nav>
            </div>
            <#-- 热门推荐 -->
            <div class="blog-body clear overflow-initial">
                <h5 class="custom-title"><i class="fa fa-fire fa-fw icon"></i><strong>热门推荐</strong><small></small></h5>
                <ul class="list-unstyled">
                    <@articleTag method="hotList" pageSize="10">
                        <#if hotList?exists && (hotList?size > 0)>
                            <#list hotList as item>
                            <li class="line-li">
                                <div class="line-container">
                                    <div class="line-right">
                                        <div class="text">
                                            <a href="${config.siteUrl}/article/${item.id?c}">
                                                ${item.title}
                                            </a>
                                        </div>
                                        <div class="text">
                                            <#--<div style="display: inline-block">热门指数：</div>-->
                                            <#--<div class="rating ignore" data-star="5"></div>-->
                                            <span class="views" data-toggle="tooltip"  data-placement="bottom" data-original-title="文章阅读次数"><i class="fa fa-eye fa-fw"></i>浏览(${item.lookCount!(0)})</span>
                                            <span class="comment" data-toggle="tooltip"  data-placement="bottom" data-original-title="文章评论次数">
                                                <a href="${config.siteUrl}/article/${item.id?c}#comment-box" rel="external nofollow">
                                                    <i class="fa fa-comments-o fa-fw"></i>评论(${item.commentCount!(0)})
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </#list>
                        </#if>
                    </@articleTag>
                </ul>
                <div class="clear"></div>
            </div>
            <#-- 相关文章 -->
            <div class="blog-body clear overflow-initial">
                <h5 class="custom-title"><i class="fa fa-google-wallet fa-fw icon"></i><strong>相关文章</strong><small></small></h5>
                <ul class="list-unstyled">
                    <#list relatedList as item>
                        <li class="line-li">
                            <div class="line-container">
                                <div class="line-right">
                                    <div class="text">
                                        <a href="${config.siteUrl}/article/${item.id?c}" data-original-title="${item.lookCount?c}人浏览了该文章" data-toggle="tooltip" data-placement="bottom">
                                            <i class="fa fa-book fa-fw"></i>${item.title}
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </#list>
                </ul>
                <div class="clear"></div>
            </div>
            <#--评论-->
            <#if article.comment>
                <div class="blog-body clear overflow-initial expansion">
                    <div id="comment-box" data-id="${article.id?c}"></div>
                </div>
            <#else>
                <div class="blog-body clear overflow-initial expansion gray">
                    <i class="fa fa-close fa-fw"></i>该篇文章的评论功能已被站长关闭
                </div>
            </#if>
        </div>
        <#include "layout/sidebar.ftl"/>
    </div>
</div>
<@footer>
    <script type="text/javascript">
        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https') {
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else {
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
    </script>
    <!--<script src="https://v1.hitokoto.cn/?encode=js&select=%23hitokoto" defer></script>-->
    <script type="text/javascript" src="https://cdn.bootcss.com/highlight.js/9.12.0/highlight.min.js"></script>
	<script type="text/javascript" src="https://cdn.bootcss.com/simplemde/1.11.2/simplemde.min.js"></script>
</@footer>