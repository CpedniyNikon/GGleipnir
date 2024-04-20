package ggleipnir.back.ggleipnirback.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Configuration

@Configuration
@ConfigurationProperties(prefix = "spring.datasource")
data class DatasourceProperties(
    var driverClassName: String = "",
    var url: String = "",
    var username: String = "",
    var password: String = ""
)
