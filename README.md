#Вем привет! хочу с вами поделить небольшим творчеством )

Проект <PhotoEditor> написан на Xcode 14.2, Swift 5.7. 
Библиотеки: SwiftUI, Firebase/Auth, Google SignIn SDK, Combine, Core Image, PencilKit, Photos Framework, MVVM архитектура

Может возникнуть ошибка на более новых версиях Xcode: ABSL_CONST_INIT extern "C" const int64_t kFIRFirestoreCacheSizeUnlimited = Settings::CacheSizeUnlimited; которая решается более новой версией FireBase 10.0.0, например.

Первый экран состоит из:
1) авторизации по email и password, если данные корректные, то с БД приходит положительный ответ и польхователь входит, иначе возникает alert, в котором указано, что где-то пользователь ошибся.
2) возможности изменить пароль, отправляется письмо на почту, если такая почта есть в базе.
3) возможность зарегистрироваться через email и password, также срабатывают предупреждения если: почта занята другим пользователем, пароль не подходит под требования, пароли не совпадают, т.к. есть необходимость продублировать пароль
4) возможность авторизоваться через Google
   
После авторизации идет переход на экран с рисованием
У него есть возможность: 
1) Отправить рисунок в социальные сети или сообщения или добавить в свою папку файл
2) сохранить рисунок в фотопленке 

![photo_4_2024-09-19_17-23-28](https://github.com/user-attachments/assets/0e8a7f01-e699-48f8-a272-11968256970f)
![photo_2_2024-09-19_17-23-28](https://github.com/user-attachments/assets/e0296905-299c-49ff-a2e4-b81a0ec20f00)
![photo_3_2024-09-19_17-23-28](https://github.com/user-attachments/assets/820665b0-8e75-4c0a-883c-a45421b1ca0b)
![photo_1_2024-09-19_17-23-28](https://github.com/user-attachments/assets/83badd97-52b2-4b29-aad9-34e6e074a91e)
![photo_5_2024-09-19_17-23-28](https://github.com/user-attachments/assets/d5c04b82-7ff0-441e-bee7-a11f63c89338)
