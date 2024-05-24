package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.model.User
import org.springframework.http.HttpStatus
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository
import org.springframework.web.server.ResponseStatusException
import java.sql.ResultSet

@Repository
class AuthRepositoryImpl(
    val jdbcTemplate: JdbcTemplate
): AuthRepository {
    override fun getUserByLogin(login: String, password: String): User {
        val query = "select * from user_info where login=? and password=? limit 1;"
        try {
            return jdbcTemplate.queryForObject(query, ::mapRow, login, password)!!
        } catch (e: Exception) {
            throw ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not found")
        }
    }

    override fun saveUser(user: User): User {
        val query = "insert into user_info(id, login, password, name, meta) values (?, ?, ?, ?, ?);"
        jdbcTemplate.update(query, user.id, user.login, user.password, user.name, user.meta)
        return user
    }

    override fun getUserById(userId: String): User {
        val query = "select * from user_info where id=?;"
        return jdbcTemplate.queryForObject(query, ::mapRow, userId)!!
    }

    private fun mapRow(rs: ResultSet, rn: Int): User {
        return User(
            rs.getString("id"),
            rs.getString("login"),
            rs.getString("password"),
            rs.getString("name"),
            rs.getString("meta")
        )
    }
}