package ggleipnir.back.ggleipnirback.controller

import ggleipnir.back.ggleipnirback.model.User
import ggleipnir.back.ggleipnirback.model.request.UserLoginRequest
import ggleipnir.back.ggleipnirback.model.request.UserRegisterRequest
import ggleipnir.back.ggleipnirback.service.AuthService
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@CrossOrigin
@RestController
class AuthController(
    val authService: AuthService
) {

    @PostMapping("/v1/login")
    fun login(
        @RequestBody request: UserLoginRequest
    ): User {
        log.info("IN /v1/login")
        val user = authService.authUser(request.login, request.password)
        log.info("OUT /v1/login")
        return user
    }

    @PostMapping("/v1/register")
    fun register(
        @RequestBody request: UserRegisterRequest
    ): User {
        log.info("IN /v1/register")
        val user = authService.saveUser(request)
        log.info("OUT /v1/register")
        return user
    }

    @GetMapping("/v1/user")
    fun getUserInfo(
        @RequestParam userId: String
    ): User {
        return authService.getUserById(userId)
    }

    companion object {
        val log: Logger = LoggerFactory.getLogger(AuthController::class.java)
    }
}