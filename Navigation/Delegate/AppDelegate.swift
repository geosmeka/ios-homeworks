//
//  AppDelegate.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 01.03.2022.
//

/*
 Задание

 Создайте новый проект с названием Navigation, используя шаблон Single View App.
 Удалите из проекта Main.storyboard, который создался по умолчанию. Не забудьте изменить конфигурацию в Info.plist.
 
 В AppDelegate.swift добавьте UITabBarController. Добавьте в него два UINavigationController. Первый будет показывать ленту пользователя, а второй — профиль.
 
 Измените Tab Bar Item у добавленных контроллеров, добавьте заголовок и картинку. Картинки можно добавить в Assets.xcassets или использовать SF Symbols.
 
 Создайте FeedViewController и ProfileViewController и добавьте их как root view controller у навигационных контроллеров.
 
 Добавьте PostViewController для показа выбранного поста. Поменяйте заголовок у контроллера и цвет главной view. Добавьте кнопку на FeedViewController и сделайте переход на экран поста. Контроллер должен показаться в стеке UINavigationController.
 
 Создайте структуру Post со свойством title: String. Создайте объект типа Post в FeedViewController и передайте его в PostViewController. В классе PostViewController выставьте title полученного поста в качестве заголовка контроллера.
 
 На PostViewController добавьте Bar Button Item в навигейшн бар. При нажатии на него должен открываться новый контроллер InfoViewController. Контроллер должен показаться модально.
 
 На InfoViewController создайте кнопку.
 При нажатии на неё должен показаться UIAlertController с заданным title, message и двумя UIAlertAction. При нажатии на UIAlertAction в консоль должно выводиться сообщение.
 */

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

