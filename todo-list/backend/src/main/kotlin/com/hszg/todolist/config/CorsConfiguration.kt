package com.hszg.todolist.config

import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.CorsRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@Configuration
class CorsConfiguration: WebMvcConfigurer {

    override fun addCorsMappings(
        registry: CorsRegistry
    ) {
        registry.addMapping("/**")
            .allowedOrigins("http://localhost:3000/, http://localhost:5173")
            .allowedMethods("GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS");
    }

}