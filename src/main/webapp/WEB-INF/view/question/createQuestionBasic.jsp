<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 7/23/2020
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<html>
<head>
    <title>Create Question</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
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
<table class="content-table">
    <thead>
    <tr>
        <th>Basic Question</th>
    </tr>
    </thead>
    <tbody>
    <tr><th>
        <form action="registerQuestion" method="post">
            <input type="hidden" id="user" name="username" value=<%= request.getParameter("username")%>>

            <h4>Create your question: </h4><br><br>

            select type:
            <select id="questionType" name="type" onchange="location.href = 'http://localhost:8080/quiz-trial/createQuestion_'+this.value;">
                <option value="basic?username=${username}" selected>Basic</option>
                <option value="blank?username=${username}">Fill in blank</option>
                <option value="test?username=${username}">Test</option>
            </select><br><br>

            <textarea id="questionBody" name="body" rows="5" cols="50" placeholder="Fill in" required></textarea><br><br>

            <label for="grade">Max Grade:</label>
            <input type="text" id="grade" name="maxGrade" value="0"><br><br>

            <label for="image">Image File:</label>
            <input type="text" id="image" name="imageFile" placeholder="optional"><br><br>

            <input type="submit" value="create">
        </form>
    </th></tr></tbody></table>
</body>
</html>
