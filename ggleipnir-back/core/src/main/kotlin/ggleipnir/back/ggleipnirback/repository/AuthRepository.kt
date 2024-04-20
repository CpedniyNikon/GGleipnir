package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.model.User

interface AuthRepository {
    fun getUserByLogin(login: String, password: String): User

    fun saveUser(user: User): User
}