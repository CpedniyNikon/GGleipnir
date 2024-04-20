package ggleipnir.back.ggleipnirback.config

import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.datasource.DriverManagerDataSource
import javax.sql.DataSource

@Configuration
@EnableConfigurationProperties(DatasourceProperties::class)
class DataConfig {
    @Bean
    fun jdbcTemplate(dataSource: DataSource): JdbcTemplate {
        return JdbcTemplate(dataSource)
    }

    @Bean
    fun dataSource(datasourceProperties: DatasourceProperties): DataSource {
        val dataSource = DriverManagerDataSource()
        dataSource.setDriverClassName(datasourceProperties.driverClassName)
        dataSource.url = datasourceProperties.url
        dataSource.username= datasourceProperties.username
        dataSource.password = datasourceProperties.password
        return dataSource
    }
}