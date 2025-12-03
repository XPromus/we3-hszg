package com.hszg.todolist

import org.springframework.context.ApplicationContextInitializer
import org.springframework.context.ConfigurableApplicationContext
import org.springframework.test.context.support.TestPropertySourceUtils
import org.testcontainers.containers.PostgreSQLContainer
import org.testcontainers.junit.jupiter.Container

class DataSourceInitializer : ApplicationContextInitializer<ConfigurableApplicationContext> {
    companion object {
        @JvmStatic
        @Container
        private val database: PostgreSQLContainer<*> = PostgreSQLContainer("postgres:15.15")
    }

    override fun initialize(applicationContext: ConfigurableApplicationContext) {
        if (!database.isRunning) {
            database.start()
        }

        TestPropertySourceUtils.addInlinedPropertiesToEnvironment(
            applicationContext,
            "spring.datasource.url=" + database.jdbcUrl,
            "spring.datasource.username=" + database.username,
            "spring.datasource.password=" + database.password
        )
    }
}
