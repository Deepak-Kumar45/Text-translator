package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Data;

import ch.qos.logback.core.model.Model;

import java.net.URLEncoder;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "home";
	}

	@GetMapping(path = "/translate")
	public String translate(@RequestParam("inputText") String text,
							@RequestParam("sourceLang") String sc,
							@RequestParam("targetLang") String tr,Model model ) throws Exception{
		System.out.println("Translate has been called");
		System.out.println(text);
		String urlApi = "https://translate.fedilab.app/translate";
		HttpPost get=new HttpPost(urlApi);
   		get.setHeader(new BasicHeader("accept", "application/json"));
   		get.setHeader(new BasicHeader("Content-Type", "application/x-www-form-urlencoded"));
   		get.setEntity(new StringEntity("q=" + URLEncoder.encode(text, "UTF-8") + "&source=" + sc + "&target=" + tr + "&format=text"));
   		CloseableHttpClient client=HttpClientBuilder.create().build();
   		org.apache.http.HttpResponse resp=client.execute(get);
   		System.out.println(resp.getStatusLine());
		String translatedText=EntityUtils.toString(resp.getEntity());
   		System.err.println(translatedText);
		return "home?data="+translatedText;
	}
}
  