package com.stefv.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;


@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/", "/action/prijavi_se").permitAll()
                .antMatchers("/action/start").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
                .antMatchers("/action/sacuvaj*").hasAnyAuthority("ROLE_ADMIN")
                .antMatchers("/action/obrisi*").hasAnyAuthority("ROLE_ADMIN")
                .antMatchers("/action/sva*").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
                .antMatchers("/action/svi*").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
                .anyRequest().authenticated().and().csrf().disable().headers().frameOptions().disable().and()
                .formLogin().loginPage("/action/prijavi_se").usernameParameter("korisnickoIme").passwordParameter("korisnickaSifra").permitAll().defaultSuccessUrl("/action/start", true).failureUrl("/").and().logout()
                .permitAll();
    }

}
 