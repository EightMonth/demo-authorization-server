-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 172.16.10.227    Database: auth_server
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oauth2_authorization`
--

DROP TABLE IF EXISTS `oauth2_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_authorization` (
  `id` varchar(100) NOT NULL,
  `registered_client_id` varchar(100) NOT NULL,
  `principal_name` varchar(200) NOT NULL,
  `authorization_grant_type` varchar(100) NOT NULL,
  `authorized_scopes` varchar(1000) DEFAULT NULL,
  `attributes` blob,
  `state` varchar(500) DEFAULT NULL,
  `authorization_code_value` blob,
  `authorization_code_issued_at` timestamp NULL DEFAULT NULL,
  `authorization_code_expires_at` timestamp NULL DEFAULT NULL,
  `authorization_code_metadata` blob,
  `access_token_value` blob,
  `access_token_issued_at` timestamp NULL DEFAULT NULL,
  `access_token_expires_at` timestamp NULL DEFAULT NULL,
  `access_token_metadata` blob,
  `access_token_type` varchar(100) DEFAULT NULL,
  `access_token_scopes` varchar(1000) DEFAULT NULL,
  `oidc_id_token_value` blob,
  `oidc_id_token_issued_at` timestamp NULL DEFAULT NULL,
  `oidc_id_token_expires_at` timestamp NULL DEFAULT NULL,
  `oidc_id_token_metadata` blob,
  `refresh_token_value` blob,
  `refresh_token_issued_at` timestamp NULL DEFAULT NULL,
  `refresh_token_expires_at` timestamp NULL DEFAULT NULL,
  `refresh_token_metadata` blob,
  `user_code_value` blob,
  `user_code_issued_at` timestamp NULL DEFAULT NULL,
  `user_code_expires_at` timestamp NULL DEFAULT NULL,
  `user_code_metadata` blob,
  `device_code_value` blob,
  `device_code_issued_at` timestamp NULL DEFAULT NULL,
  `device_code_expires_at` timestamp NULL DEFAULT NULL,
  `device_code_metadata` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_authorization`
--

LOCK TABLES `oauth2_authorization` WRITE;
/*!40000 ALTER TABLE `oauth2_authorization` DISABLE KEYS */;
INSERT INTO `oauth2_authorization` VALUES ('55de99ad-9f53-49aa-a6b3-7745f47764f7','3eacac0e-0de9-4727-9a64-6bdd4be2ee1f','user','authorization_code','openid,profile',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\":{\"@class\":\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\",\"authorizationUri\":\"http://localhost:9000/oauth2/authorize\",\"authorizationGrantType\":{\"value\":\"authorization_code\"},\"responseType\":{\"value\":\"code\"},\"clientId\":\"oidc-client\",\"redirectUri\":\"http://www.baidu.com\",\"scopes\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\",\"profile\"]],\"state\":null,\"additionalParameters\":{\"@class\":\"java.util.Collections$UnmodifiableMap\"},\"authorizationRequestUri\":\"http://localhost:9000/oauth2/authorize?response_type=code&client_id=oidc-client&scope=openid%20profile&redirect_uri=http://www.baidu.com\",\"attributes\":{\"@class\":\"java.util.Collections$UnmodifiableMap\"}},\"java.security.Principal\":{\"@class\":\"org.springframework.security.authentication.UsernamePasswordAuthenticationToken\",\"authorities\":[\"java.util.Collections$UnmodifiableRandomAccessList\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"USER\"}]],\"details\":{\"@class\":\"org.springframework.security.web.authentication.WebAuthenticationDetails\",\"remoteAddress\":\"0:0:0:0:0:0:0:1\",\"sessionId\":\"A4F0AEFCCC56B2D8A517D37F137936BE\"},\"authenticated\":true,\"principal\":{\"@class\":\"org.springframework.security.core.userdetails.User\",\"password\":null,\"username\":\"user\",\"authorities\":[\"java.util.Collections$UnmodifiableSet\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"USER\"}]],\"accountNonExpired\":true,\"accountNonLocked\":true,\"credentialsNonExpired\":true,\"enabled\":true},\"credentials\":null}}',NULL,_binary 'iFVoWc7t44kujU5v-3_tGhKtdlfR_w-U2ty76GRRuYyB6ExRGehf3Y-vparigXQ61ecLuD-YABJJaxVjiLIFmd227ufFrltuO36zTrjHsHQYVzDTbo09Athkwnpw_FFV','2023-12-29 09:37:40','2023-12-29 09:42:40',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":true}',_binary 'eyJraWQiOiIwZDU3ODFhMy0yNGZhLTQ3ZWYtYmExMS1hMWEwNTk4ZThmYWEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiYXVkIjoib2lkYy1jbGllbnQiLCJuYmYiOjE3MDM4NDI3NDUsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiXSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo5MDAwIiwiZXhwIjoxNzAzODQzMDQ1LCJpYXQiOjE3MDM4NDI3NDV9.IG3Ii_KQTT2Mxp7JK3dZCgA22_GIGKsK19PclPLghRLkbojA6kzBLdpRisMXZlu187X3m5DfWZ2pRa8Fui-QoDdTlFMpbKZkw0wEDpmexNlwvYw2vpM8jGrADRzb5ujftJgLEXi7jPs2Qw2N-n6eSHAOVgsjpNId8N3Yg-g8CioAQAli9iIh_3b_kHlH0RqPL43rgqL1cTLD66kjvolpjPuaB-Evg-ueqryI9XSRIrvbHn-ak1wQcsr5l0lQve0xTq0droDTtwtA1_1NsQ5dkwgpMkuEQTlAUEfkzrrAhDIFYRjUQArW0TrTiJhtR3hcEGKm1VYySYz7FQgVqnlG0Q','2023-12-29 09:39:05','2023-12-29 09:44:05',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.claims\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"sub\":\"user\",\"aud\":[\"java.util.Collections$SingletonList\",[\"oidc-client\"]],\"nbf\":[\"java.time.Instant\",1703842745.398995100],\"scope\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\",\"profile\"]],\"iss\":[\"java.net.URL\",\"http://localhost:9000\"],\"exp\":[\"java.time.Instant\",1703843045.398995100],\"iat\":[\"java.time.Instant\",1703842745.398995100]},\"metadata.token.invalidated\":false}','Bearer','openid,profile',_binary 'eyJraWQiOiIwZDU3ODFhMy0yNGZhLTQ3ZWYtYmExMS1hMWEwNTk4ZThmYWEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiYXVkIjoib2lkYy1jbGllbnQiLCJhenAiOiJvaWRjLWNsaWVudCIsImF1dGhfdGltZSI6MTcwMzg0MjY1OSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo5MDAwIiwiZXhwIjoxNzAzODQ0NTQ1LCJpYXQiOjE3MDM4NDI3NDUsInNpZCI6IkxmcTJKMFVaWUl1N29HNl9GMHIxaVMxZS0tSzVjLUxVZUlvaTBwSnlBVlUifQ.it204LBc5YZT_ROauNdsR-s5YUlLivnTch0MOOW2qxlT1K219CNopRh48-ZkaSPRsGeYUgWgB9DZuEOurjFsdaND0Ed6Ih1RNaQx73lB6wsud65EqNzryo6tP6af010ETDvTBDQYFXJp8tilOgE2QfDK9Bbq0SwVTfOc9yPhKLgmimoaQqEMIFcGba7pHLN0LEUGVmG11n6tHkWSsgtjYZntvuHF6E0Fl8136bZRslAgmLsEWijkI2ckcb0yDIlUp6bPoHCKXPuzR4M8ke6S8qCvqooB9hQrnMdAdu-wIybsh6sLjpTPgRhfxZv8gYvvisqL9kziDvIymb3Jr2Ov_g','2023-12-29 09:39:05','2023-12-29 10:09:05',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.claims\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"sub\":\"user\",\"aud\":[\"java.util.Collections$SingletonList\",[\"oidc-client\"]],\"azp\":\"oidc-client\",\"auth_time\":[\"java.util.Date\",1703842659836],\"iss\":[\"java.net.URL\",\"http://localhost:9000\"],\"exp\":[\"java.time.Instant\",1703844545.497539800],\"iat\":[\"java.time.Instant\",1703842745.497539800],\"sid\":\"Lfq2J0UZYIu7oG6_F0r1iS1e--K5c-LUeIoi0pJyAVU\"},\"metadata.token.invalidated\":false}',_binary 'scTF4PDfggq0EPCaYPoK6EtS52LadeZ6s3Y24rhU6bZM-CudKAqjPZkkn_IIVFBtSR0TzlKyBcCxHt-I5IEKAPIiDzTleF_Dj6Nk319NEQ2lt7jYgyun4aaaD-ZBlTN4','2023-12-29 09:39:05','2023-12-29 10:39:05',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":false}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('e49035ce-d49a-4fd2-ad0b-ac5968f8c89c','3eacac0e-0de9-4727-9a64-6bdd4be2ee1f','user','authorization_code','openid,profile',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\":{\"@class\":\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\",\"authorizationUri\":\"http://localhost:9000/oauth2/authorize\",\"authorizationGrantType\":{\"value\":\"authorization_code\"},\"responseType\":{\"value\":\"code\"},\"clientId\":\"oidc-client\",\"redirectUri\":\"http://www.baidu.com\",\"scopes\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\",\"profile\"]],\"state\":null,\"additionalParameters\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"continue\":\"\"},\"authorizationRequestUri\":\"http://localhost:9000/oauth2/authorize?response_type=code&client_id=oidc-client&scope=openid%20profile&redirect_uri=http://www.baidu.com&continue=\",\"attributes\":{\"@class\":\"java.util.Collections$UnmodifiableMap\"}},\"java.security.Principal\":{\"@class\":\"org.springframework.security.authentication.UsernamePasswordAuthenticationToken\",\"authorities\":[\"java.util.Collections$UnmodifiableRandomAccessList\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER\"}]],\"details\":{\"@class\":\"org.springframework.security.web.authentication.WebAuthenticationDetails\",\"remoteAddress\":\"0:0:0:0:0:0:0:1\",\"sessionId\":\"26F3C87ED2BAF567704B1EAEFA57E8B9\"},\"authenticated\":true,\"principal\":{\"@class\":\"org.springframework.security.core.userdetails.User\",\"password\":null,\"username\":\"user\",\"authorities\":[\"java.util.Collections$UnmodifiableSet\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER\"}]],\"accountNonExpired\":true,\"accountNonLocked\":true,\"credentialsNonExpired\":true,\"enabled\":true},\"credentials\":null}}',NULL,_binary 'JiZlmATIrSA6vvODW_U83MrCw_wUAoG_iy5X8D_c6jDQxKPSFRaK8bGNI4mrNNsBdXcenvCs73lsrNT8bnX-76g4HEJ8SlRaA4DWZOTxlLhnvPQHp2SpU9Qo_DHWDO-Q','2023-12-29 08:54:23','2023-12-29 08:59:23',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":true}',_binary 'eyJraWQiOiIxNzljMWRiMC1lNmRmLTRhMTctYTQ4Ni1lNjZlNDhhMTYyNTIiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiYXVkIjoib2lkYy1jbGllbnQiLCJuYmYiOjE3MDM4NDAwNzksInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiXSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo5MDAwIiwiZXhwIjoxNzAzODQwMzc5LCJpYXQiOjE3MDM4NDAwNzl9.xM5ap12YkLTOcL_79G8O7I5uGXCoWRbiVBz8PaGtw_OBOf3lQcnnA9OmtZJgfCCFc33a1BVCo2a65eVQjC7FCa9cyC0ZLi4RnXay4lX8SNAtv2ccU28xnTihwHazwBGCPIYF0ycu0f4gxghfGUU7xhYkVwxPMnAyrsRrjCyrG63IaWcHPlNblZAKFv3TQ_SLIgFC3gkCRQ7tzLEh05y5lStskWdCnaL4Kr8rtuRNweqJd3ZBSS9XGqulv64mzkeC3Q6CMmTAnByHlRz1UgC0dWCdH01vPl5ayP1mINKe_F7_M9012Ihcv6sYsuEZMf4ypIuwVKO3DYGgooej7xYDjQ','2023-12-29 08:54:39','2023-12-29 08:59:39',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.claims\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"sub\":\"user\",\"aud\":[\"java.util.Collections$SingletonList\",[\"oidc-client\"]],\"nbf\":[\"java.time.Instant\",1703840079.122266500],\"scope\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\",\"profile\"]],\"iss\":[\"java.net.URL\",\"http://localhost:9000\"],\"exp\":[\"java.time.Instant\",1703840379.122266500],\"iat\":[\"java.time.Instant\",1703840079.122266500]},\"metadata.token.invalidated\":false}','Bearer','openid,profile',_binary 'eyJraWQiOiIxNzljMWRiMC1lNmRmLTRhMTctYTQ4Ni1lNjZlNDhhMTYyNTIiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiYXVkIjoib2lkYy1jbGllbnQiLCJhenAiOiJvaWRjLWNsaWVudCIsImF1dGhfdGltZSI6MTcwMzg0MDA2MiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo5MDAwIiwiZXhwIjoxNzAzODQxODc5LCJpYXQiOjE3MDM4NDAwNzksInNpZCI6IlNBVnFCTEh1OFVwRmVjWW41czZLSU00YzBxaEZWODdiS2ZFT3QxamtvNnMifQ.GBUsTyYcc2-8-o98jp-LaZLW1xnc6Uh9cIMW2rrEArYN4g89TvCzrfVBpstCi3WY3kO5LurtuNgJEuHDgdazArvbR7_QrdwTBGAzJwejTvmht2IfkbaNDvnSZzoHrVyi-4G-sXR275wmwXUSjgirsziewG6STzjFrUxYdywz6z4L8RpaJv_uJY_zP3DazpucsQl18O2ywOHbXa_yIGBegmVhRMoB0FAhsZnTR7mJWuE9Cyz3d9BFKV2UZJxOJ2wz5YRsRUlR0ELJ8JJ3uekcsa4rLd0usF--dWMi_k1vc_Em_R00fokZbBhxiaAecgp6kZec2ICGVtChI0qlTf8vqA','2023-12-29 08:54:39','2023-12-29 09:24:39',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.claims\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"sub\":\"user\",\"aud\":[\"java.util.Collections$SingletonList\",[\"oidc-client\"]],\"azp\":\"oidc-client\",\"auth_time\":[\"java.util.Date\",1703840062884],\"iss\":[\"java.net.URL\",\"http://localhost:9000\"],\"exp\":[\"java.time.Instant\",1703841879.201902200],\"iat\":[\"java.time.Instant\",1703840079.201902200],\"sid\":\"SAVqBLHu8UpFecYn5s6KIM4c0qhFV87bKfEOt1jko6s\"},\"metadata.token.invalidated\":false}',_binary 'fnNBWY-WAeNjTIeOeCz-X4intXiQhNQu3O19xmeutOGObzXWKvaXPUAIkeeCKBkmGRHZZ-ZOtLrl7fons3es8kuQkL02Ifn6x9HhKiBZJJSpqbJjFEefax0mrq_Z_imf','2023-12-29 08:54:39','2023-12-29 09:54:39',_binary '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":false}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth2_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_authorization_consent`
--

DROP TABLE IF EXISTS `oauth2_authorization_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_authorization_consent` (
  `registered_client_id` varchar(100) NOT NULL,
  `principal_name` varchar(200) NOT NULL,
  `authorities` varchar(1000) NOT NULL,
  PRIMARY KEY (`registered_client_id`,`principal_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_authorization_consent`
--

LOCK TABLES `oauth2_authorization_consent` WRITE;
/*!40000 ALTER TABLE `oauth2_authorization_consent` DISABLE KEYS */;
INSERT INTO `oauth2_authorization_consent` VALUES ('3eacac0e-0de9-4727-9a64-6bdd4be2ee1f','user','SCOPE_openid,SCOPE_profile');
/*!40000 ALTER TABLE `oauth2_authorization_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_registered_client`
--

DROP TABLE IF EXISTS `oauth2_registered_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_registered_client` (
  `id` varchar(100) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_id_issued_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_secret` varchar(200) DEFAULT NULL,
  `client_secret_expires_at` timestamp NULL DEFAULT NULL,
  `client_name` varchar(200) NOT NULL,
  `client_authentication_methods` varchar(1000) NOT NULL,
  `authorization_grant_types` varchar(1000) NOT NULL,
  `redirect_uris` varchar(1000) DEFAULT NULL,
  `post_logout_redirect_uris` varchar(1000) DEFAULT NULL,
  `scopes` varchar(1000) NOT NULL,
  `client_settings` varchar(2000) NOT NULL,
  `token_settings` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_registered_client`
--

LOCK TABLES `oauth2_registered_client` WRITE;
/*!40000 ALTER TABLE `oauth2_registered_client` DISABLE KEYS */;
INSERT INTO `oauth2_registered_client` VALUES ('3eacac0e-0de9-4727-9a64-6bdd4be2ee1f','oidc-client','2023-07-12 07:33:42','$2a$10$Q8fyHbiE6IcxR3lPGDMWbONUOihByVMyaD8Mx6W./Qt8u3SsoaMWq',NULL,'3eacac0e-0de9-4727-9a64-6bdd4be2ee1f','client_secret_basic','refresh_token,authorization_code','http://www.baidu.com','http://127.0.0.1:8080/','openid,profile','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.access-token-format\":{\"@class\":\"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat\",\"value\":\"self-contained\"},\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000],\"settings.token.authorization-code-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.device-code-time-to-live\":[\"java.time.Duration\",300.000000000]}');
/*!40000 ALTER TABLE `oauth2_registered_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `status` tinyint DEFAULT NULL COMMENT '状态（1：正常 0：停用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'user','$2a$10$tnXo4i38e4tilvdzIXgmzufTFDc/HrXM3Axcg4twfIa079X7Ocjfq','测试用户','Spring Security 测试用户',1);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-29 17:41:30
