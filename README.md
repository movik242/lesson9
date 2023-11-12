# lesson9

***Домашнее задание***

Задача написать скрипт для CRON, который раз в час будет формировать письмо и отправлять на заданную почту.

Дан файл с логами: logMovik.log

*Список IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;

*Список запрашиваемых URL (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;

*Ошибки веб-сервера/приложения c момента последнего запуска;

*Список всех кодов HTTP ответа с указанием их кол-ва с момента последнего запуска скрипта;

*Скрипт должен предотвращать одновременный запуск нескольких копий, до его завершения.

Скрипт scriptURL.sh:

      Читаем лог
      Забираем URL
      Сортировка
      Подсчет уникальных URL с выводом количества повторений
      Вывод информации во временный файл
      Условие выведет на URL адреса с количеством повторений больше 5

Скрипт scriptIP.sh:

      Читает лог
      awk берет столбец с ip адресами
      Сортировка
      Подсчет уникальных адресов с выводом количества повторений
      Вывод информации во временный файл
      Условие выведет на экран адреса с количеством повторений больше 10

Скрипт error.sh:

      Забираем коды ошибок в файл tmp
      Забираем в файл временной диапазон лога
      Выводим информацию со временем и коды ошибок

Собираем вывод всех скриптов в один файл скрипт parse.sh

![image](https://github.com/movik242/lesson9/assets/143793993/f96544da-706c-42d6-8247-4f7b05f9d53e)

Настраиваю postfix и cron для запуска каждый час с проверкой, что запущен один экземпляр

postfix настроил по статье https://www.dmosk.ru/miniinstruktions.php?mini=postfix-over-yandex

Чтобы предотвращать одновременный запуск нескольких копий воспользовался утилитой flock

Добавил запись в /etc/crontab -e

        4 */1 * * * root /usr/bin/flock -n /var/tmp/parse.lock sh /root/Bash/parse.sh | mail -s "Test" -r ****@yandex.ru ****@yandex.ru

![image](https://github.com/movik242/lesson9/assets/143793993/9effeddf-2f03-453c-8c59-4310e1d2977e)





