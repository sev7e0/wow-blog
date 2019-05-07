<div class="col-sm-3 blog-sidebar">
    <#if articleDetail?exists>
        <div class="sidebar-module">
            <h5 class="custom-title"><i class="fa fa-hand-peace-o fa-fw icon"></i><strong>说给你听</strong><small></small></h5>
            <div class="div-quote">
                <i class="fa fa-quote-left fa-fw"></i><p id="hitokoto" style="margin-left: 15px;"></p>
            </div>
        </div>
    <#else>
        <div class="sidebar-module" style="position: relative;">
            <h5 class="custom-title"><i class="fa fa-hand-peace-o fa-fw icon"></i><strong>关于我</strong><small></small></h5>
            <div class="widget">
                <div id="feed_widget">
                    <div class="feed-about">
                           <ul class="list-unstyled">
                               <li><i class="fa fa-info-circle fa-fw"></i>博主：<small>李</small></li>
                               <li><i class="fa fa-user-circle fa-fw"></i>职业：<small>进城务工人员</small></li>
                               <li>

                            <i class="fa fa-github fa-fw"></i>GitHub：<small><a href="${config.github}" name="github" target="_blank" rel="external nofollow">Sev7e0</a></small>
                               </li>
                               <li>

                           <i class="fa fa-envelope-o fa-fw"></i>邮箱：<small><a href="mailto:${config.authorEmail}" name="email" target="_blank" rel="external nofollow">sev7e0@mail.com</a></small>
                              </li>
                             <!-- <li>
                          <i class="fa fa-home fa-fw"></i>微博：<small><a href="${config.weibo}" name="点击查看我的微博" target="_blank" rel="external nofollow">一个丑人</a></small>
                             </li>-->
                           </ul>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </#if>
    <div class="sidebar-module article-module hide" style="top: 0;">
        <h5 class="custom-title"><i class="fa fa-book fa-fw icon"></i><strong>本文目录</strong><i class="fa fa-close pull-right close-article-menu hide pointer"></i><small></small></h5>
        <div id="article-menu">
            <ul class="list-unstyled"></ul>
        </div>
    </div>
    <div class="sidebar-module">
        <h5 class="custom-title"><i class="fa fa-tags fa-fw icon"></i><strong>标签云</strong><small></small></h5>
        <@zhydTag method="tagsList" pageSize="10">
            <#if tagsList?exists && (tagsList?size > 0)>
                <#list tagsList as item>
                    <a style="font-size: <@zhydTag method="random" max="15" min="10">${random}</@zhydTag>px;margin: 5px;" href="${config.siteUrl}/tag/${item.id?c}" name="${item.name?if_exists}" data-toggle="tooltip" data-placement="bottom">
                        ${item.name?if_exists}
                    </a>
                </#list>
            </#if>
        </@zhydTag>
    </div>
    <@zhydTag method="recentComments" pageSize="10">
        <#if recentComments?? && recentComments?size gt 0>
            <div class="sidebar-module">
                <h5 class="custom-title"><i class="fa fa-comments fa-fw icon"></i><strong>近期评论</strong><small></small></h5>
                <ul class="list-unstyled list-inline comments">
                <#list recentComments as item>
                    <li>
                        <a href="${item.sourceUrl}#comment-${item.id?c}" name="${item.briefContent?if_exists}" rel="external nofollow" data-toggle="tooltip" data-placement="bottom">
                            <img alt="${item.nickname?if_exists}" src="${item.avatar?if_exists}" class="avatar auto-shake" height="64" width="64" onerror="this.src='${config.staticWebSite}/img/user.png'" />
                            <span class="comment-author">${item.nickname?if_exists}</span> ${item.briefContent?if_exists}
                        </a>
                    </li>
                </#list>
                </ul>
            </div>
        </#if>
    </@zhydTag>
    <div class="sidebar-module">
        <ul class="nav nav-tabs sidebar-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-list"></i>近期文章</a></li>
            <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-thumbs-o-up"></i>站长推荐</a></li>
            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><i class="fa fa-random"></i>随机文章</a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="profile">
                <ol class="list-unstyled">
                    <@articleTag method="recentArticles" pageSize="10">
                        <#if recentArticles?exists && (recentArticles?size > 0)>
                            <#list recentArticles as item>
                                <li>
                                    <a href="${config.siteUrl}/article/${item.id?c}" name="${item.title}" data-toggle="tooltip" data-placement="bottom">
                                        <i class="fa fa-book fa-fw"></i> ${item.title}
                                    </a>
                                </li>
                            </#list>
                        <#else>
                            <li class="empty-list">
                                <i class="fa fa-bookmark-o fa-fw"></i> 暂无相关文章
                            </li>
                        </#if>
                    </@articleTag>
                </ol>
            </div>
            <div role="tabpanel" class="tab-pane" id="home">
                <ol class="list-unstyled">
                    <@articleTag method="recommendedList" pageSize="10">
                        <#if recommendedList?exists && (recommendedList?size > 0)>
                            <#list recommendedList as item>
                                <li>
                                    <a href="${config.siteUrl}/article/${item.id?c}" name="${item.title}" data-toggle="tooltip" data-placement="bottom">
                                        <i class="fa fa-book fa-fw"></i> ${item.title}
                                    </a>
                                </li>
                            </#list>
                        <#else>
                            <li class="empty-list">
                                <i class="fa fa-bookmark-o fa-fw"></i> 暂无相关文章
                            </li>
                        </#if>
                    </@articleTag>
                </ol>
            </div>
            <div role="tabpanel" class="tab-pane" id="messages">
                <ol class="list-unstyled">
                    <@articleTag method="randomList" pageSize="10">
                        <#if randomList?exists && (randomList?size > 0)>
                            <#list randomList as item>
                                <li>
                                    <a href="${config.siteUrl}/article/${item.id?c}" name="${item.title}" data-toggle="tooltip" data-placement="bottom">
                                        <i class="fa fa-book fa-fw"></i> ${item.title}
                                    </a>
                                </li>
                            </#list>
                        <#else>
                            <li class="empty-list">
                                <i class="fa fa-bookmark-o fa-fw"></i> 暂无相关文章
                            </li>
                        </#if>
                    </@articleTag>
                </ol>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="sidebar-module">
        <h5 class="custom-title"><i class="fa fa-info fa-fw icon"></i><strong>网站信息</strong><small></small></h5>
        <ul class="ul-default site-info">
            <@zhydTag method="siteInfo">
                <li> <i class="fa fa-file fa-fw"></i>  文章总数：${siteInfo.articleCount!(0)} 篇</li>
                <li> <i class="fa fa-tags fa-fw"></i> 标签总数：${siteInfo.tagCount!(0)} 个</li>
                <li> <i class="fa fa-folder-open fa-fw"></i> 分类总数：${siteInfo.typeCount!(0)} 个</li>
                <li> <i class="fa fa-comments fa-fw"></i> 留言数量：${siteInfo.commentCount!(0)} 条</li>
                <li> <i class="fa fa-users fa-fw"></i> 在线人数：<span class="online">1</span>人</li>
                <li> <i class="fa fa-calendar fa-fw"></i> 运行天数：${siteInfo.buildSiteDate!(0)}天</li>
                <li> <i class="fa fa-pencil-square fa-fw"></i> 最后更新：${siteInfo.lastUpdateTime}</li>
            </@zhydTag>
        </ul>
    </div>
</div>