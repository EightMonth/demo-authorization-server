package com.example.auth.config.password;

import com.example.auth.constant.Constants;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.server.authorization.authentication.OAuth2AuthorizationGrantAuthenticationToken;

import javax.security.auth.Subject;
import java.util.Map;

/**
 * @author kezhijie@co-mall.com
 * @date 2024/1/1
 */
public class PasswordGrantAuthenticationToken extends OAuth2AuthorizationGrantAuthenticationToken {

    public PasswordGrantAuthenticationToken(Authentication clientPrincipal, Map<String, Object> additionalParameters) {
        super(new AuthorizationGrantType(Constants.GRANT_TYPE_PASSWORD), clientPrincipal, additionalParameters);
    }

}
