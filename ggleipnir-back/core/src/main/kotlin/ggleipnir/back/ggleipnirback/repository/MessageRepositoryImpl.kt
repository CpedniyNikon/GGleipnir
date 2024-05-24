package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.repository.model.MessageDao
import ggleipnir.back.ggleipnirback.util.IdGenerator
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository
import java.sql.ResultSet
import java.time.Instant

@Repository
class MessageRepositoryImpl(
    val jdbcTemplate: JdbcTemplate
) : MessageRepository {
    override fun sendMessageToLobby(userId: String, lobbyId: String, message: String?, login: String) {
        val queryToSendMessage = "insert into lobby_message(id, lobby_id, user_id, message, created_at, user_login) values (?,?,?,?,?,?);"
        jdbcTemplate.update(queryToSendMessage, IdGenerator.generateUuid(), lobbyId, userId, message, Instant.now().toEpochMilli(), login)
    }

    override fun getMessageHistoryFromLobby(lobbyId: String): List<MessageDao> {
        val queryToGetMessageHistory = "select * from lobby_message where lobby_id=? order by created_at desc;"
        val messages: List<MessageDao> = jdbcTemplate.query(queryToGetMessageHistory, ::mapMessage, lobbyId)
        return messages
    }

    private fun mapMessage(rs: ResultSet, rn: Int): MessageDao {
        return MessageDao(
            id = rs.getString("id"),
            lobbyId = rs.getString("lobby_id"),
            userId = rs.getString("user_id"),
            message = rs.getString("message"),
            createdAt = rs.getLong("created_at"),
            userLogin = rs.getString("user_login")
        )
    }
}