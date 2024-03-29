<%@ page contentType="text/html;charset=utf-8" %>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Сайт для определения попадания точки в область</title>
    <!-- Подключаем bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        <%@include file="../../resources/css/styles.css"%>
    </style>
    <!-- Подключаем bootstrap 5 js -->
</head>
<body>
    <div class="container-fluid">
        <!-- Шапка сайта с фамилией и группой студента -->
        <div class="row">
            <div class="col-12 bg-light">
                <div class="header">
                    <h3 class="text-center">Студент: Васькин Вячеслав Денисович</h3>
                    <h3 class="text-center">Группа: P3211 | ИСУ: 33231 | <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Задание
                    </button></h3>
                </div>
            </div>
        </div>
        <div class="row justify-content-center main">
            <!-- Картинка с графиком -->
            <div class="col-3 graph">
                <svg width="260" height="260" viewBox="0 0 260 260" xmlns="http://www.w3.org/2000/svg" id="graph">
                    <!-- 2 четверть -->
                    <circle r="100" cx="130" cy="130" fill="#add8e6"/>
                    <rect x="0" y="130" width="260" height="130" fill="white" />
                    <rect x="130" y="0" width="130" height="130" fill="white" />
                    <!-- 1 четверть -->
                    <polygon points="230, 130 130,30 130,130" fill="#add8e6"/>
                    <!-- 4 четверть -->
                    <rect x=130 y=130 width=50 height=100 fill="#add8e6"/>
                    <!-- Ось X -->
                    <line x1="0" y1="130" x2="350" y2="130" stroke="black"/>
                    <!-- Ось Y -->
                    <line x1="130" y1="0" x2="130" y2="260" stroke="black"/>
                    <!-- R на оси X -->
                    <text x=230 y=127 font-size=12 font-family="Arial">R</text>
                    <text x=180 y=127 font-size=12 font-family="Arial">R/2</text>
                    <text x=80 y=127 font-size=12 font-family="Arial">-R/2</text>
                    <text x=30 y=127 font-size=12 font-family="Arial">-R</text>
                    <!-- R на оси Y -->
                    <text x=133 y=230 font-size=12 font-family="Arial">-R</text>
                    <text x=133 y=180 font-size=12 font-family="Arial">-R/2</text>
                    <text x=133 y=80 font-size=12 font-family="Arial">R/2</text>
                    <text x=133 y=30 font-size=12 font-family="Arial">R</text>
                </svg>
            </div>
            <!-- Форма для ввода X, Y и R -->
            <div class="col-4">
                <form method="POST" id="form" onsubmit="event.preventDefault(); sendForm(document.getElementById('x-input').value, document.getElementById('y-input').value, document.getElementById('r-input').value);">
                    <div class="form-group">
                        <div class="row">
                            <label for="x-input">Введите X (-3 ... 3)</label>
                            <input type="number" id="x-input" step="0.0001" name="x" min="-3" max="3" class="form-control" required>
                        </div>
                        <div class="row">
                            <label for="y-input">Выберите Y (-3 ... 5)</label>
                            <select id="y-input" name="y" class="form-control" required>
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
                            <select id="r-input" name="r" class="form-control" required>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col gy-3" style="padding-left: 0">
                                <button type="submit" class="btn btn-primary gy-3 form-control" id="submit-button">Проверить</button>
                            </div>
                            <div class="col gy-3" style="padding-right: 0">
                                <button type="button" class="btn btn-warning gy-3 form-control" id="clear-button" onclick="clearTable()">Очистка</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
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
        <!-- Таблица с результатами -->
        <div id="table-container" style="padding-top: 40px">
            <table class="table gy-5 table-light table-striped">
                <thead>
                <tr>
                    <th scope="col">Время</th>
                    <th scope="col">Координаты</th>
                    <th scope="col">Попадание</th>
                    <th scope="col">Время выполнения скрипта</th>
                </tr>
                </thead>
                <tbody id="results-table">
                </tbody>
            </table>
        </div>

    </div>
    <script>
        function createCircle(x, y) {
            var circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
            // Устанавливаем атрибуты для круга (цвет, радиус, координаты)
            circle.setAttribute("cx", x);
            circle.setAttribute("cy", y);
            circle.setAttribute("r", 5); // Радиус круга (можно установить другое значение)
            circle.setAttribute("class", "graph_circle")
            // Добавляем круг внутрь SVG элемента
            return circle;
        }
        function setCircleFill(circle, fill) {
            circle.setAttribute("fill", fill)
        }
        function addRow(rowData) {
            if (rowData.x == null) rowData.x = "Некорректный X"
            if (rowData.y == null) rowData.y = "Некорректный Y"
            if (rowData.r == null) rowData.r = "Некорректный R"
            let tableRef = document.getElementById('results-table');
            tableRef.innerHTML =
                `<tr>
                    <th>${rowData.timestamp}</th>
                    <td>${rowData.x}, ${rowData.y}, ${rowData.r}</td>
                    <td>${rowData.hitMessage}</td>
                    <td>${rowData.executionTime}</td>
                </tr>`
                + tableRef.innerHTML;

            if (rowData.isValid === true) {
                let svg = document.getElementById('graph');
                var svgRect = svg.getBoundingClientRect();

                let x = (rowData.x * 100) + svgRect.width / 2;
                let y = -(rowData.y * 100) + svgRect.height / 2;

                let circle = createCircle(x, y);
                svg.appendChild(circle);

                if (rowData.isHit === true) setCircleFill(circle, "green")
                else setCircleFill(circle, "red");
            }

        }
    </script>
    <script>
        document.getElementById('graph').addEventListener('click', function(event) {
            var svg = document.getElementById('graph');
            var svgRect = svg.getBoundingClientRect();
            var svgX = svgRect.x + svgRect.width / 2; // центр квадрата
            var svgY = svgRect.y + svgRect.height / 2; // центр квадрата

            var mouseX = event.clientX;
            var mouseY = event.clientY;

            var offsetX = (mouseX - svgX) / 100;
            var offsetY = (svgY - mouseY) / 100;

            sendForm(offsetX, offsetY, 1, false);
        });

    </script>
    <script>
        function sendForm(x, y, r, showTable=false) {
            // Параметры запроса
            const params = new URLSearchParams();
            params.append('x', x);
            params.append('y', y);
            params.append('r', r);
            params.append('showTable', showTable.toString());

            // Опции запроса
            const requestOptions = {
                method: 'POST',
                body: params
            };

            // Выполнение POST запроса
            var baseUrl = window.location.protocol + "//" + window.location.host;
            return fetch(baseUrl + '/JakartaLabs-2/2', requestOptions)
                .then(response => response.json())
                .then(data => {
                    data.forEach(tableRow => {
                        addRow(tableRow);
                    })
                })
                .catch(error => console.error('Ошибка при выполнении запроса:', error));
        }
        window.onload = () => sendForm(document.getElementById('x-input').value, document.getElementById('y-input').value, document.getElementById('r-input').value, true);
    </script>
    <script>
        function clearTable() {
            // Параметры запроса
            const params = new URLSearchParams();
            params.append('clearTable', 'true');

            // Опции запроса
            const requestOptions = {
                method: 'POST',
                body: params
            };
            // Выполнение POST запроса
            var baseUrl = window.location.protocol + "//" + window.location.host;
            fetch(baseUrl + '/JakartaLabs-2/2', requestOptions)
                .then(response => response.text())
                .then(() => {
                    document.getElementById('results-table').innerHTML = '';
                    document.querySelectorAll('.graph_circle').forEach(circle => circle.remove());
                })
                .catch(error => console.error('Ошибка при выполнении запроса:', error));
        }
    </script>
</body>
</html>