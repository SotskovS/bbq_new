# Приложение для сбора друзей на мероприятия

В приложении Пользователь может создать мероприятие, показано место на ЯндексКартах, приходят уведомления на электронную почту о желающих присоединиться и добавленных фотографиях.
Приложение размещено на heroku, фотографии загружаются на aws.amazon

https://svalgele-bbq.herokuapp.com/

ruby '2.7.0'
rails '6.0.3'

Для запуска необходимо:
  * nodejs > 10.0
  
Запуск:
  * bundle
  * bundle exec rake db:migrate
  * bundle exec rails s 
