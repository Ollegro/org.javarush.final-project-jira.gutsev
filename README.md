## [REST API](http://localhost:8080/doc)

## Концепция:

- Spring Modulith
    - [Spring Modulith: достигли ли мы зрелости модульности](https://habr.com/ru/post/701984/)
    - [Introducing Spring Modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)
    - [Spring Modulith - Reference documentation](https://docs.spring.io/spring-modulith/docs/current-SNAPSHOT/reference/html/)

```
  url: jdbc:postgresql://localhost:5432/jira
  username: jira
  password: JiraRush
```

- Есть 2 общие таблицы, на которых не fk
    - _Reference_ - справочник. Связь делаем по _code_ (по id нельзя, тк id привязано к окружению-конкретной базе)
    - _UserBelong_ - привязка юзеров с типом (owner, lead, ...) к объекту (таска, проект, спринт, ...). FK вручную будем
      проверять

## Аналоги

- https://java-source.net/open-source/issue-trackers

## Тестирование

- https://habr.com/ru/articles/259055/

Список выполненных задач:
2. Удалены социальные сети: vk, yandex.
3. Вынесена чувствительная информация в secret.env.
4. Для тестов поднимается H2, определены два бина в AppConfig c профилями test и prod.
5. Написаны тесты для ProfileRestController.
6. Изменен метод - com.javarush.jira.bugtracking.attachment.FileUtil#upload под использование NIO
7. Добавлены tags для задач task и протестировано по REST API.
9. Написан Dockerfile.
10. Написан docker-compose для запуска контейнера сервера вместе с БД postgresql и nginx.
11. Добавлена локализацию на нескольких языках для шаблонов писем (mails) и стартовой страницы index.html.

...