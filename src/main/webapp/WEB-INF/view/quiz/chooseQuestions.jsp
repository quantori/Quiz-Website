<%@ page import="java.util.List" %>
<%@ page import="com.quiz.model.quiz.question.QuestionBasic" %>
<%@ page import="com.quiz.model.quiz.question.utils.QuestionType" %>
<%@ page import="com.quiz.model.quiz.question.QuestionTest" %>
<%@ page import="com.quiz.model.quiz.question.QuestionFillBlank" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 7/26/2020
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Choose Question</title>
</head>
<body>
    <form action="assembleQuestions" method="post">
        <label for ="name"> Quiz Name: </label>
        <input type ="text" name="quizName" id="name" required><br><br>
        <h4>Please choose questions for quiz:</h4><br>
        <%
            @SuppressWarnings("unchecked") List<QuestionBasic> list = (List<QuestionBasic>)request.getAttribute("questions");
            for (int i = 0; i < list.size(); i++){
                QuestionBasic q = list.get(i);
                if(q.getType().equals(QuestionType.TEST)){
                    QuestionTest qt = (QuestionTest)q;
                    out.println("<h4> max grade: "+qt.getMaxGrade()+"</h4>");
                    out.println("<h4>"+qt.getBody()+"</h4>");
                    for(int j = 0; j < qt.getAnswers().size();j++){
                        out.println("<h4>"+j+") "+qt.getBody()+"</h4>");
                    }
                }else if(q.getType().equals(QuestionType.BLANK)){
                    QuestionFillBlank qb = (QuestionFillBlank) q;
                    out.println("<h4> max grade: "+qb.getMaxGrade()+"</h4>");
                    out.println("<h4>"+qb.toString()+"</h4>");
                }else{
                    out.println("<h4> max grade: "+q.getMaxGrade()+"</h4>");
                    out.println("<h4>"+q.toString()+"</h4>");
                }
                out.print("<label for=\""+"question"+i+"\"> choose</label>");
                out.print("<input type=\"checkbox\""+"name=\""+"question"+i+"\" value=\""+q.getId()+"\"><br>");
                out.print("<h4>"+"-----------------------------------------------------------------"+"</h4>");
            }
        %>
        <input type="hidden" id="user" name="username" value=<%= request.getParameter("username")%>>
        <input type="submit" value="create Quiz">
    </form>
</body>
</html>
