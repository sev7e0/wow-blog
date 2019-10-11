package com.zyd.blog.core.websocket.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.Charsets;
import org.springframework.util.CollectionUtils;

import javax.websocket.OnMessage;
import javax.websocket.Session;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Set;

/**
 * websocket工具类，支持单条发送和批量发送
 *
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @website https://www.zhyd.me
 * @date 2018/4/18 11:48
 * @since 1.0
 */
@Slf4j
public class WebSocketUtil {

    private static final String ONLINE_MSG_KEY = "online";
    private static final String NOTIFICATION_MSG_KEY = "notification";
    private static final String NOTIFICATION = "服务消息：";

    private WebSocketUtil() {
        // 私有化构造方法，禁止new
    }

    /**
     * 根据消息类型，生成发送到客户端的最终消息内容
     *
     * @param type
     *         消息类型
     * @param content
     *         消息正文
     * @return
     */
    private static String generateMsg(String type, String content) {
        return String.format("{\"fun\": \"%s\", \"msg\":\"%s\"}", type, content);
    }

    /**
     * 发送在线用户的消息
     *
     * @param msg
     * @param sessionSet
     */
    public static void sendOnlineMsg(String msg, Set<Session> sessionSet) {
        broadcast(generateMsg(ONLINE_MSG_KEY, msg), sessionSet);
    }

    /**
     * 发送通知的消息
     *
     * @param msg
     * @param sessionSet
     */
    public static void sendNotificationMsg(String msg, Set<Session> sessionSet) throws UnsupportedEncodingException {
        // 为了防止消息中存在特殊字符（比如换行符）等造成前台解析错误，此处编码一次。前台对应的需要解码
        broadcast(generateMsg(NOTIFICATION_MSG_KEY, URLEncoder.encode(NOTIFICATION + msg, Charsets.UTF_8.displayName())), sessionSet);
    }

    /**
     * 向客户端发送消息
     *
     * @param message
     *         消息内容
     * @param session
     *         客户端session
     */
    @OnMessage
    private static void sendMessage(String message, Session session) {
        try {
            session.getAsyncRemote().sendText(message);
        } catch (Exception e) {
            try {
                session.close();
            } catch (IOException ex) {
                log.error("[Socket] websocket 关闭异常: {}", e.getMessage());
            }
            log.warn("[Socket] websocket-->向客户端发送数据发生异常: {}", e.getMessage());
        }
    }

    /**
     * 群发
     *
     * @param message
     *         消息内容
     * @param sessionSet
     *         客户端session列表
     * @throws IOException
     */
    private static void broadcast(String message, Set<Session> sessionSet) {
        if (CollectionUtils.isEmpty(sessionSet)) {
            return;
        }
        // 多线程群发
        for (Session entry : sessionSet) {
            synchronized(entry){
                if (entry.isOpen()) {
                    sendMessage(message, entry);
                } else sessionSet.remove(entry);
            }
        }
    }
}
