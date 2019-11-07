import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import User.User;


public class Filter implements javax.servlet.Filter {
    //Глобальный массив
    HashMap<String, User> globalHashMap = new HashMap<String, User>();
    FilterConfig filterConfig;

    public void destroy() {
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        filterConfig = fConfig;
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //Синхронизация потоков
        synchronized (this) {
            //Проверка, зарегистрирован ли такой пользователь
            // (есть ли в глобальном массиве такой id сессии)
            if (!globalHashMap.containsKey(((HttpServletRequest) req).getSession().getId())) {
                globalHashMap.put(((HttpServletRequest) req).getSession().getId(), new User(req.getParameter("name")));
                //Запись в лог
                System.out.println("Session id = " + ((HttpServletRequest) req).getSession().getId());
                System.out.println("Login = " + req.getParameter("name"));
                User regSuccess = new User("Вы были успешно зарегистрированы!Введите логин на предыдущей странице для авторизации!");
                ((HttpServletRequest) req).getSession().setAttribute("user", regSuccess);
                req.getRequestDispatcher("/success.jsp").forward(req, resp);
                return;
            } else {
                //Если пользователь с таким id существует,
                //происходит проверка , под тем ли логином он вошел в систему
                if (!req.getParameter("name").equals(globalHashMap.get(((HttpServletRequest) req).getSession().getId()).getName())) {
                    //Если логин не совпадает, происходит возврат к странице,
                    //где будет выведена информация о неверном логине
                    User wrongLogin = new User("ЭТО НЕ ВАШ ЛОГИН! В ДОСТУПЕ ОТКАЗАНО!!!");
                    ((HttpServletRequest) req).getSession().setAttribute("user",
                            wrongLogin);
                    req.getRequestDispatcher("/success.jsp").forward(req, resp);
                    return;
                }
                //Получение cookies
                Cookie[] cookies = ((HttpServletRequest) req).getCookies();
                //Если куки отключены, то происходит редирект на страницу логина
                if (cookies == null) {
                    ((HttpServletResponse) resp).sendRedirect("/index.jsp");
                }
                //Просмотр всех куки, чтение JSESSIONID,
                // и проверка соответствующего значения
                for (Cookie c : cookies) {
                    if (c.getName().equals("JSESSIONID")) {
                        //К куки браузер добавляет в конце .helios
                        Pattern pattern = Pattern.compile("(.+?).helios");
                        Matcher matcher = pattern.matcher(c.getValue());
                        if (matcher.find()) {
                            //Исправляем
                            c.setValue(matcher.group(1));
                        }
                        //Запись в лог
                        System.out.println("Cookie ID = " + c.getValue());
                        if (globalHashMap.containsKey(c.getValue())) {
                            //Авторизация прошла! Возвращаем обьект user
                            ((HttpServletRequest) req).getSession().setAttribute("user", globalHashMap.get(c.getValue()));
                            req.getRequestDispatcher("/success.jsp").forward(req, resp);
                            return;
                        } else {
                            //Авторизация не прошла
                            User wrongId = new User("В доступе отказано!");
                            ((HttpServletRequest) req).getSession().setAttribute("user", wrongId);
                            req.getRequestDispatcher("/success.jsp").forward(req, resp);
                            return;
                        }
                    }
                }

            }
            req.getRequestDispatcher("/success.jsp").forward(req, resp);
            return;
        }


    }
}
