<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 7/23/2020
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>Create Question</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .button {
            background-color: DodgerBlue;
            border: none;
            color: white;
            padding: 12px 16px;
            font-size: 16px;
            cursor: pointer;
        }

        .button1 {
            background-color: green;
        }

        /* Darker background on mouse-over */
        .button:hover {
            background-color: RoyalBlue;
        }

        .button1:hover {
            background-color: darkgreen;
        }

        .content-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            border-radius: 5px 5px 0 0;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }

        .content-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }

        .content-table th,
        .content-table td {
            padding: 12px 15px;
        }

        .content-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .content-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .content-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }
    </style>
</head>
<body>

<form name="homepageForm" action="homepage" method="post">
    <button class="button" onclick="homepageForm.submit()"><i class="fa fa-home"></i> Homepage</button>
    <input type="hidden" name="username" value=<%=request.getParameter("username")%>>
</form>

<table class="content-table">
    <thead>
    <tr>
        <th>Test Question</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th>
            <form name="regForm" action="registerQuestion" method="post">
                <input type="hidden" id="user" name="username" value=<%= request.getParameter("username")%>>
                <h4>Create your question: </h4><br>

                select type:
                <select id="questionType" name="type"
                        onchange="location.href = 'http://localhost:8080/quiz-trial/createQuestion_'+this.value;">
                    <option value="basic?username=${username}" selected>Basic</option>
                    <option value="blank?username=${username}">Fill in blank</option>
                    <option value="test?username=${username}" selected>Test</option>
                </select><br><br>

                <textarea id="questionBody" name="body" rows="5" cols="50" placeholder="Fill in"
                          required></textarea><br><br>

                <label for="grade">Max Grade:</label>
                <input type="text" id="grade" name="maxGrade" value="0"><br><br>

                <label for="image">Image File:</label>
                <input type="text" id="image" name="imageFile" placeholder="optional"><br><br>

                <label for="answer">Correct Answer:</label>
                <input type="text" id="answer" name="correctAnswer"><br><br>

                <label for="answers">Probable Answers:</label><br>
                <h4>please use ',' between answers</h4>
                <textarea id="answers" name="answers" rows="1" cols="50" placeholder="enter probable answers"
                          required></textarea><br><br>

                <button class="button button1" onclick="regForm.submit()"><i class="fa fa-question-circle"></i> Create
                </button>
            </form>
        </th>
    </tr>
    </tbody>
</table>
</body>
</html>