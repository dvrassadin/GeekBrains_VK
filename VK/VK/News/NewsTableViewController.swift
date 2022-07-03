//
//  NewsTableViewController.swift
//  VK
//
//  Created by Daniil Rassadin on 03.07.2022.
//

import UIKit

class NewsTableViewController: UITableViewController, UITextViewDelegate {
    
    let news = [
        News(text: """
Умер новосибирский ученый Дмитрий Колкер, сообщили «Комсомольская правда» и источник «Тайги.инфо». Ему было 54 года.

30 июня сотрудники ФСБ задержали Колкера по подозрению в госизмене прямо в больнице. Его туда доставили накануне из-за ухудшения самочувствия. Родные Колкера говорили, что у него четвертая стадия рака поджелудочной железы (фотография справа была сделана незадолго до задержания).

«В семь часов [утра] забрали больного человека, который практически при смерти и питался через трубочку в вене, из частной клиники. При этом только там ему могли помочь (мы были во всех клиниках Новосибирска), — рассказывал «Тайге.инфо» сын ученого. — И в семь утра мне звонит следователь, что ваш отец арестован. <...> Потом следователь говорил маме, что там [в СИЗО] классные условия, есть холодильник. Человек питается из трубочки в вене, а не из холодильника».

По словам мужчины, его отца «обвинили в том, что он предоставил Китайской народной республике данные, содержащие государственную тайну».
""",
             image: UIImage(named: "kolker")),
        News(text: """
🇺🇸 Посольство США в Москве отказалось указывать новый адрес «площадь Донецкой Народной Республики»

Теперь вместо адреса написаны координаты
""",
             image: UIImage(named: "USembassy")),
        News(text: """
🥴 «Обидно видеть то, что не можешь купить, правда?»

Вот такие слова россияне заметили в обновлении приложения магазина ASOS
""",
             image: UIImage(named: "ASOS")),
        News(text: """
"Большая семерка" планирует ввести верхний предел цены на нефть из России "на уровне примерно в половину текущей цены и создать механизм, который не позволит покупать ее дороже", заявил премьер-министр Японии Фумио Кисида.

Эксперты опасаются, что Россия в ответ на ограничение цен может сократить ежедневную добычу нефти на 5 млн баррелей. Это может вызвать рост мировых цен на сырье до "стратосферных" $380 за баррель.
""",
             image: nil),
        News(text: """
В Петербурге открыли одну из самых высоких в городе смотровых площадок на вершине колокольни собора Владимирской иконы Божией Матери. С высоты 41 метра  открывается завораживающий вид на весь город

Попасть на смотровую площадку можно два раза в день – в 13:00 и 15:00
""",
             image: UIImage(named: "SPBviewpoint")),
        News(text: """
Сегодня появилась информация, что в ресторанах «Вкусно и точка» (бывший McDonald’s) в продаже появилось пиво. В компании заявили, что «в сети не продается и не планируется к продаже алкогольная продукция».

«Фотографии, о которых идет речь, сделаны в одном из предприятий бывшего франчайзи McDonald’s, чьи рестораны расположены на вокзалах и в аэропортах. Сегодня эта компания не имеет никакого отношения не только к сети „Вкусно и точка“, но также к McDonald’s: они больше не являются франчайзи корпорации, не присоединились к новой сети и продолжают свою деятельность самостоятельно, со своими стандартами работы, ассортиментом и так далее», — приводит РИА «Новости» сообщение компании.
""",
             image: UIImage(named: "RFMcDonalds"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsViewCell

        cell.newsText.text = news[indexPath.row].text
        cell.newsImage.image = news[indexPath.row].image ?? UIImage(systemName: "newspaper")

        return cell
    }
}
