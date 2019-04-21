package com.king.vo;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/2/23 16:15
 * @Modified By
 **/
public class GetReplyListVo {

    private int userId;

    private String name;

    private String nickname;

    private int parentReplyId;

    private int parentReplyUserId;

    private String parentReplyName;

    private String parentReplyNickname;

    private String content;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getParentReplyId() {
        return parentReplyId;
    }

    public void setParentReplyId(int parentReplyId) {
        this.parentReplyId = parentReplyId;
    }

    public int getParentReplyUserId() {
        return parentReplyUserId;
    }

    public void setParentReplyUserId(int parentReplyUserId) {
        this.parentReplyUserId = parentReplyUserId;
    }

    public String getParentReplyName() {
        return parentReplyName;
    }

    public void setParentReplyName(String parentReplyName) {
        this.parentReplyName = parentReplyName;
    }

    public String getParentReplyNickname() {
        return parentReplyNickname;
    }

    public void setParentReplyNickname(String parentReplyNickname) {
        this.parentReplyNickname = parentReplyNickname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
