package com.jspshop.domain;

import lombok.Data;

@Data
public class Color {
	public Color() {
		System.out.println("Color 생성자 호출");
	}
	private int color_idx;
	private Product product;//부모인 Product 을 assocation으로 가져옴
	private String color_name;
}
