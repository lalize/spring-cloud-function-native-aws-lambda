package com.example.springcloudfunctionnativeawslambda

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean

@SpringBootApplication
class SpringCloudFunctionNativeAwsLambdaApplication {
    @Bean
    fun hello(): () -> String = { "Hello from Lambda!" }
}

fun main(args: Array<String>) {
    runApplication<SpringCloudFunctionNativeAwsLambdaApplication>(*args)
}
