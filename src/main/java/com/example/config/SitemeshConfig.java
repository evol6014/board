package com.example.config;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class SitemeshConfig {
	
	@Bean
	FilterRegistrationBean<ConfigurableSiteMeshFilter> siteMeshFilter() {
		FilterRegistrationBean<ConfigurableSiteMeshFilter> filter =
				new FilterRegistrationBean<>();
		
		filter.setFilter(new ConfigurableSiteMeshFilter() {
			@Override
			protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
				builder.addDecoratorPaths("/board/*", "/WEB-INF/decorators/board.jsp");
				builder.addDecoratorPaths("/dept/*", "/WEB-INF/decorators/board.jsp");
				builder.addDecoratorPaths("/emp/*", "/WEB-INF/decorators/board.jsp");
				builder.addDecoratorPaths("/city/*", "/WEB-INF/decorators/board.jsp");
				builder.addDecoratorPaths("/country/*", "/WEB-INF/decorators/board.jsp");
				builder.addDecoratorPaths("/ontime/*", "/WEB-INF/decorators/board.jsp");
				builder.addDecoratorPaths("/bootstrap/*", "/WEB-INF/decorators/bootstrap.jsp");
				
			}
		});
		
		filter.setUrlPatterns(Arrays.asList("/board/*",
												 "/dept/*",
												 "/emp/*",
												 "/city/*",
												 "/country/*",
												 "/ontime/*",
												 "/bootstrap/*"));
		
		return filter;
	}

	@Bean
	FilterRegistrationBean<Filter> testFilter() {
		FilterRegistrationBean<Filter> filter = new FilterRegistrationBean<>();
		
		filter.setFilter(new Filter() {
			
			@Override
			public void init(FilterConfig filterConfig) throws ServletException {
				System.out.println("###################");
				System.out.println("## My Filter init()");
				System.out.println("###################");
			}
			
			@Override
			public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
					throws IOException, ServletException {

				System.out.println("###");
				System.out.println("## My Filter doFilter() start ...");
				System.out.println("###");
				chain.doFilter(request, response);
				System.out.println("###");
				System.out.println("## My Filter doFilter() end ...");
				System.out.println("###");
			}
			
			@Override
			public void destroy() {
				System.out.println("######################");
				System.out.println("## My Filter destroy()");
				System.out.println("######################");
			}
		});
		filter.setUrlPatterns(Arrays.asList("/dept/*", "/emp/*"));	// url 매핑 / 지정한 주소에 있는거 호출할때는 이 필터를 거친다.
		
		return filter;
	}
	
}
