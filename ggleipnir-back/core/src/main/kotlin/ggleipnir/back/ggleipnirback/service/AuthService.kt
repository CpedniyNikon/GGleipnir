package ggleipnir.back.ggleipnirback.service

import ggleipnir.back.ggleipnirback.model.User
import ggleipnir.back.ggleipnirback.model.request.UserRegisterRequest
import ggleipnir.back.ggleipnirback.repository.AuthRepository
import ggleipnir.back.ggleipnirback.util.IdGenerator
import org.springframework.stereotype.Service

@Service
class AuthService(
    val authRepository: AuthRepository
) {
    fun authUser(login: String, password: String): User {
        return authRepository.getUserByLogin(login, password)
    }

    fun saveUser(user: UserRegisterRequest): User {
        val domainModel = User(
            IdGenerator.generateUuid(),
            user.login,
            user.password,
            user.name,
            user.meta
        )
        return authRepository.saveUser(domainModel)
    }

}