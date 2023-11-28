package com.spring.entity;

import org.springframework.stereotype.Component;

@Component
public class Data {
    private String text;
    private String source;
    private String target;
    public Data(String text, String source, String target) {
        this.text = text;
        this.source = source;
        this.target = target;
    }
    public String getText() {
        return text;
    }
    @Override
    public String toString() {
        return "Data [text=" + text + ", source=" + source + ", target=" + target + "]";
    }
    public Data() {
    }
    public void setText(String text) {
        this.text = text;
    }
    public String getSource() {
        return source;
    }
    public void setSource(String source) {
        this.source = source;
    }
    public String getTarget() {
        return target;
    }
    public void setTarget(String target) {
        this.target = target;
    }
        
}
