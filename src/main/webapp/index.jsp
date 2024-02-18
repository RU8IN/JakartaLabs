<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Сайт для определения попадания точки в область</title>
    <!-- Подключаем bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        <%@include file="css/styles.css"%>
    </style>
    <!-- Подключаем bootstrap 5 js -->
</head>
<body>
<div class="container-fluid">
    <!-- Шапка сайта с фамилией и группой студента -->
    <div class="row">
        <div class="col-12 bg-light">
            <div class="header">
                <h3 class="text-center">Студент: Васькиин Вячеслав Денисович</h3>
                <h3 class="text-center">Группа: P3211 | ИСУ: 33231 | <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Задание
                </button></h3>
            </div>
        </div>
    </div>
    <div class="row justify-content-center main">
        <!-- Картинка с графиком -->
        <div class="col-3 graph">
            <img src="<c:url value="/images/graph.png">" alt="График" id="graph">
        </div>
        <!-- Форма для ввода X, Y и R -->
        <div class="col-4">
            <form>
                <div class="form-group">
                    <div class="row">
                        <label for="x-input">Введите X (-3 ... 3)</label>
                        <input type="float" id="x-input" name="x" min="-3" max="3" class="form-control">
                    </div>
                    <div class="row">
                        <label for="y-input">Выберите Y (-3 ... 5)</label>
                        <select id="y-input" name="y" class="form-control">
                            <option value="-3">-3</option>
                            <option value="-2">-2</option>
                            <option value="-1">-1</option>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="row">
                        <label for="r-input">Выберите R (1 ... 5)</label>
                        <select id="r-input" name="r" class="form-control">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="row">
                        <button type="submit" class="btn btn-primary gy-3 form-control" id="submit-button">Проверить</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Таблица с результатами -->
    <div class="row">
        <table class="table gy-5 table-light table-striped">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Handle</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>
    </div>


    <!-- Модальное окно -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Задание</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <div class="modal-body">
                    <div>

                        <p>Разработать веб-приложение на базе сервлетов и JSP, определяющее попадание точки на координатной плоскости в заданную область.</p>

                        <p>Приложение должно быть реализовано в соответствии с <a href="https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller" target="_blank">шаблоном MVC</a> и состоять из следующих элементов:</p>

                        <ul>
                            <li><strong>ControllerServlet</strong>, определяющий тип запроса, и, в зависимости от того, содержит ли запрос информацию о координатах точки и радиусе, делегирующий его обработку одному из перечисленных ниже компонентов. Все запросы внутри приложения должны передаваться этому сервлету (по методу GET или POST в зависимости от варианта задания), остальные сервлеты с веб-страниц напрямую вызываться не должны.</li>
                            <li><strong>AreaCheckServlet</strong>, осуществляющий проверку попадания точки в область на координатной плоскости и формирующий HTML-страницу с результатами проверки. Должен обрабатывать все запросы, содержащие сведения о координатах точки и радиусе области.</li>
                            <li><strong>Страница JSP</strong>, формирующая HTML-страницу с веб-формой. Должна обрабатывать все запросы, не содержащие сведений о координатах точки и радиусе области.</li>
                        </ul>

                        <p><strong>Разработанная страница JSP должна содержать:</strong></p>

                        <ol>
                            <li>"Шапку", содержащую ФИО студента, номер группы и номер варианта.</li>
                            <li>Форму, отправляющую данные на сервер.</li>
                            <li>Набор полей для задания координат точки и радиуса области в соответствии с вариантом задания.</li>
                            <li>Сценарий на языке JavaScript, осуществляющий валидацию значений, вводимых пользователем в поля формы.</li>
                            <li>Интерактивный элемент, содержащий изображение области на координатной плоскости (в соответствии с вариантом задания) и реализующий следующую функциональность:
                                <ul>
                                    <li>Если радиус области установлен, клик курсором мыши по изображению должен обрабатываться JavaScript-функцией, определяющей координаты точки, по которой кликнул пользователь и отправляющей полученные координаты на сервер для проверки факта попадания.</li>
                                    <li>В противном случае, после клика по картинке должно выводиться сообщение о невозможности определения координат точки.</li>
                                    <li>После проверки факта попадания точки в область изображение должно быть обновлено с учётом результатов этой проверки (т.е., на нём должна появиться новая точка).</li>
                                </ul>
                            </li>
                            <li>Таблицу с результатами предыдущих проверок. Список результатов должен браться из контекста приложения, HTTP-сессии или Bean-компонента в зависимости от варианта.</li>
                        </ol>

                        <p><strong>Страница, возвращаемая AreaCheckServlet, должна содержать:</strong></p>

                        <ol>
                            <li>Таблицу, содержащую полученные параметры.</li>
                            <li>Результат вычислений - факт попадания или непопадания точки в область.</li>
                            <li>Ссылку на страницу с веб-формой для формирования нового запроса.</li>
                        </ol>

                        <p>Разработанное веб-приложение необходимо развернуть на сервере <a href="https://wildfly.org/" target="_blank">WildFly</a>. Сервер должен быть запущен в standalone-конфигурации, порты должны быть настроены в соответствии с выданным portbase, доступ к http listener'у должен быть открыт для всех IP.</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>