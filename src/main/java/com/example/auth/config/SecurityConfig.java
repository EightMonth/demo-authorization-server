package com.example.auth.config;

import com.example.auth.config.password.PasswordGrantAuthenticationConvert;
import com.example.auth.config.password.PasswordGrantAuthenticationProvider;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jose.jwk.source.ImmutableJWKSet;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import org.apache.catalina.util.StandardSessionIdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.oidc.IdTokenClaimNames;
import org.springframework.security.oauth2.core.oidc.endpoint.OidcParameterNames;
import org.springframework.security.oauth2.jwt.JwsHeader;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.oauth2.server.authorization.*;
import org.springframework.security.oauth2.server.authorization.client.JdbcRegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.config.annotation.web.configuration.OAuth2AuthorizationServerConfiguration;
import org.springframework.security.oauth2.server.authorization.config.annotation.web.configurers.OAuth2AuthorizationServerConfigurer;
import org.springframework.security.oauth2.server.authorization.settings.AuthorizationServerSettings;
import org.springframework.security.oauth2.server.authorization.token.*;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.util.matcher.MediaTypeRequestMatcher;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.time.Instant;
import java.util.Date;
import java.util.UUID;

/**
 * @author kezhijie@wuhandsj.com
 * @date 2023/12/29 14:59
 */
@Configuration
@EnableWebSecurity
@EnableMethodSecurity(jsr250Enabled = true, securedEnabled = true)
public class SecurityConfig {

    private static final String CUSTOM_CONSENT_PAGE_URI = "/oauth2/consent";
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Spring Authorization Server 相关配置
     * 此处方法与下面defaultSecurityFilterChain都是SecurityFilterChain配置，配置的内容有点区别，
     * 因为Spring Authorization Server是建立在Spring Security 基础上的，defaultSecurityFilterChain方法主要
     * 配置Spring Security相关的东西，而此处authorizationServerSecurityFilterChain方法主要配置OAuth 2.1和OpenID Connect 1.0相关的东西
     */
    @Bean
    @Order(1)
    public SecurityFilterChain authorizationServerSecurityFilterChain(HttpSecurity http)
            throws Exception {
        OAuth2AuthorizationServerConfiguration.applyDefaultSecurity(http);
        http.getConfigurer(OAuth2AuthorizationServerConfigurer.class)
                .tokenEndpoint(tokenEndpoint -> tokenEndpoint.accessTokenRequestConverter(new PasswordGrantAuthenticationConvert()).authenticationProvider(new PasswordGrantAuthenticationProvider(userDetailsService, passwordEncoder(), authorizationService(),tokenGenerator())))
                //开启OpenID Connect 1.0（其中oidc为OpenID Connect的缩写）。
                .oidc(Customizer.withDefaults());	// Enable OpenID Connect 1.0
        http
                //将需要认证的请求，重定向到login页面行登录认证。
                .exceptionHandling((exceptions) -> exceptions
                        .defaultAuthenticationEntryPointFor(
                                new LoginUrlAuthenticationEntryPoint("/login"),
                                new MediaTypeRequestMatcher(MediaType.TEXT_HTML)
                        )
                )
                // 使用jwt处理接收到的access token
                .oauth2ResourceServer(oauth2ResourceServer ->
                        oauth2ResourceServer.jwt(Customizer.withDefaults()));

        return http.build();
    }

    /**
     *Spring Security 过滤链配置（此处是纯Spring Security相关配置）
     */
    @Bean
    @Order(2)
    public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http)
            throws Exception {
        http
                //设置所有请求都需要认证，未认证的请求都被重定向到login页面进行登录
                .authorizeHttpRequests((authorize) -> authorize
                        .anyRequest().authenticated()
                )
                .oauth2ResourceServer(oauth2 -> oauth2.jwt(Customizer.withDefaults()));
                // 由Spring Security过滤链中UsernamePasswordAuthenticationFilter过滤器拦截处理“login”页面提交的登录信息。
//                .formLogin(Customizer.withDefaults());

        return http.build();
    }

    /**
     *设置用户信息，校验用户名、密码
     * 这里或许有人会有疑问，不是说OAuth 2.1已经移除了密码模式了码？怎么这里还有用户名、密码登录？
     * 例如：某平台app支持微信登录，用户想使用微信账号登录登录该平台app，则用户需先登录微信app，
     * 此处代码的操作就类似于某平台app跳到微信登录界面让用户先登录微信，然后微信校验用户提交的用户名、密码，
     * 登录了微信才对某平台app进行授权，对于微信平台来说，某平台的app就是OAuth 2.1中的客户端。
     * 其实，这一步是Spring Security的操作，纯碎是认证平台的操作，是脱离客户端（第三方平台）的。
     */
//    @Bean
//    public UserDetailsService userDetailsService() {
//        UserDetails userDetails = User.withDefaultPasswordEncoder()
//                .username("user")
//                .password("password")
//                .roles("USER")
//                .build();
////基于内存的用户数据校验
//        return new InMemoryUserDetailsManager(userDetails);
//    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * 注册客户端信息
     */
    @Bean
    public RegisteredClientRepository registeredClientRepository() {
        return new JdbcRegisteredClientRepository(jdbcTemplate);
    }

    /**
     * 授权信息
     * 对应表：oauth2_authorization
     */
    @Bean
    public OAuth2AuthorizationService authorizationService() {
        return new JdbcOAuth2AuthorizationService(jdbcTemplate, registeredClientRepository());
    }

    /**
     * 授权确认
     *对应表：oauth2_authorization_consent
     */
    @Bean
    public OAuth2AuthorizationConsentService authorizationConsentService(JdbcTemplate jdbcTemplate, RegisteredClientRepository registeredClientRepository) {
        return new JdbcOAuth2AuthorizationConsentService(jdbcTemplate, registeredClientRepository);
    }

    /**
     *配置 JWK，为JWT(id_token)提供加密密钥，用于加密/解密或签名/验签
     * JWK详细见：https://datatracker.ietf.org/doc/html/draft-ietf-jose-json-web-key-41
     */
    @Bean
    public JWKSource<SecurityContext> jwkSource() {
        KeyPair keyPair = generateRsaKey();
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
        RSAKey rsaKey = new RSAKey.Builder(publicKey)
                .privateKey(privateKey)
                .keyID(UUID.randomUUID().toString())
                .build();
        JWKSet jwkSet = new JWKSet(rsaKey);
        return new ImmutableJWKSet<>(jwkSet);
    }

    /**
     *生成RSA密钥对，给上面jwkSource() 方法的提供密钥对
     */
    private static KeyPair generateRsaKey() {
        KeyPair keyPair;
        try {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(2048);
            keyPair = keyPairGenerator.generateKeyPair();
        }
        catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
        return keyPair;
    }

    /**
     * 配置jwt解析器
     */
    @Bean
    public JwtDecoder jwtDecoder(JWKSource<SecurityContext> jwkSource) {
        return OAuth2AuthorizationServerConfiguration.jwtDecoder(jwkSource);
    }

    /**
     *配置认证服务器请求地址
     */
    @Bean
    public AuthorizationServerSettings authorizationServerSettings() {
        return AuthorizationServerSettings.builder().build();
    }

    /**
     *配置token生成器
     */
    @Bean
    OAuth2TokenGenerator<?> tokenGenerator() {
        JwtGenerator jwtGenerator = new JwtGenerator(new NimbusJwtEncoder(jwkSource()));
        OAuth2AccessTokenGenerator accessTokenGenerator = new OAuth2AccessTokenGenerator();
        OAuth2RefreshTokenGenerator refreshTokenGenerator = new OAuth2RefreshTokenGenerator();
        return new DelegatingOAuth2TokenGenerator(
                jwtGenerator, accessTokenGenerator, refreshTokenGenerator);
    }

    @Bean
    public OAuth2TokenCustomizer<JwtEncodingContext> jwtCustomizer() {
        return context -> {
            JwsHeader.Builder headers = context.getJwsHeader();
            JwtClaimsSet.Builder claims = context.getClaims();
            if (context.getTokenType().equals(OAuth2TokenType.ACCESS_TOKEN)) {
                // 自定义 access_token headers/claims

            } else if (context.getTokenType().getValue().equals(OidcParameterNames.ID_TOKEN)) {
                // 自定义 id_token headers/claims for
                claims.claim(IdTokenClaimNames.AUTH_TIME, Date.from(Instant.now()));
                StandardSessionIdGenerator standardSessionIdGenerator = new StandardSessionIdGenerator();
                claims.claim("sid", standardSessionIdGenerator.generateSessionId());

            }
        };
    }

    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println(encoder.encode("secret"));
    }
}
